import JSON3

const preamble = """
import Dates
import JSON3
import SaferIntegers
import StructTypes
import TimeZones

abstract type AbstractFHIRType
end

abstract type AbstractResource <: AbstractFHIRType
end

const Date = Dates.Date
const DateTime = Dates.DateTime
const SafeInt32 = SaferIntegers.SafeInt32
const Time = Dates.Time
const ZonedDateTime = TimeZones.ZonedDateTime
const string_fhir = String

# const FHIRNumber = Float64
const FHIRInt32 = SafeInt32

struct FHIRNumber <: AbstractFHIRType
    value::String
end
@inline Base.getindex(x::FHIRNumber) = x.value::String
@inline StructTypes.StructType(::Type{T}) where {T <: FHIRNumber} = JSON3.RawType()
@inline StructTypes.construct(::Type{T}, x::JSON3.RawValue) where {T <: FHIRNumber} = FHIRNumber(unsafe_string(pointer(x.bytes, x.pos), x.len))
@inline JSON3.rawbytes(x::FHIRNumber) = codeunits(x.value)

abstract type AbstractContainer{T} <: AbstractFHIRType
end

struct ResourceList
end
"""

const _already_defined_types = String[
    "BigFloat",
    "Bool",
    "Date",
    "DateTime",
    "FHIRNumber",
    "FHIRInt32",
    "SafeInt32",
    "String",
    "Time",
    "ZonedDateTime",
    "Union{DateTime, ZonedDateTime}",
    "string_fhir",
    "ResourceList",
]

@inline function _determine_field_type(propertyname_symbol::Symbol,
                                       property_info::AbstractDict;
                                       additional_mappings::AbstractDict{Symbol, String})::Tuple{String, String}
    definitions_regex = r"^#\/definitions\/([\w]*)$"
    propertyname_string = String(propertyname_symbol)
    these_map_to_fhirint32 = Symbol[
        :allowedUnsignedInt,
        :answerInteger,
        :defaultValueInteger,
        :defaultValuePositiveInt,
        :defaultValueUnsignedInt,
        :detailInteger,
        :doseNumberPositiveInt,
        :fixedInteger,
        :fixedPositiveInt,
        :fixedUnsignedInt,
        :maxValueInteger,
        :maxValuePositiveInt,
        :maxValueUnsignedInt,
        :minValueInteger,
        :minValuePositiveInt,
        :minValueUnsignedInt,
        :multipleBirthInteger,
        :seriesDosesPositiveInt,
        :usedInteger,
        :usedPositiveInt,
        :usedUnsignedInt,
        :valueInteger,
        :valuePositiveInt,
        :valueUnsignedInt,
    ]
    these_map_to_fhirnumber = Symbol[
        :BigFloat,
        :answerDecimal,
        :defaultValueDecimal,
        :fixedDecimal,
        :maxValueDecimal,
        :minValueDecimal,
        :probabilityDecimal,
        :valueDecimal,
        #
        :patternDecimal,
        #
        :patternInteger,
        :patternPositiveInt,
        :patternUnsignedInt,
    ]
    if propertyname_symbol == :resourceType
        return "String", ""
    elseif propertyname_symbol in haskey(additional_mappings, propertyname_symbol)
        mapped_to_type = convert(String, additional_mappings[propertyname_symbol])::String
        return mapped_to_type, ""
    elseif propertyname_symbol in  these_map_to_fhirint32
        return "FHIRInt32", ""
    elseif propertyname_symbol in these_map_to_fhirnumber
        return "FHIRNumber", ""
    elseif :type in keys(property_info)
        typestring = property_info[:type]
        if typestring == "array"
            items = property_info[:items]
            singlekey = only(collect(keys(property_info[:items])))
            if singlekey == :enum
                array_eltype = "String"
            else
                refvalue = items[singlekey]
                m = match(definitions_regex, refvalue)
                array_eltype = String(fhir_to_julia_maybe(m[1]))::String
            end
            return "Vector{$(array_eltype)}"::String, array_eltype::String
        else
            return _determine_field_type(typestring)::Tuple{String, String}
        end
        return _determine_field_type(property_info[:type])
    elseif haskey(property_info, Symbol("\$ref"))
        refvalue = property_info[Symbol("\$ref")]
        m = match(definitions_regex, refvalue)
        typestring = String(fhir_to_julia_maybe(m[1]))::String
        return _determine_field_type(typestring)::Tuple{String, String}
    elseif haskey(property_info, "enum")
        return "String", ""
    end
    throw(ArgumentError("unknown field: $(propertyname_symbol)"))
end

@inline function _determine_field_type(typestring::String)::Tuple{String, String}
    if has_julia_name(typestring)
        return fhir_to_julia(typestring)::String, ""
    end
    return typestring::String, ""
end


"""
    output_fhir_types(; fhir_release, output_file, schema_string)

Generate the FHIR types and save them in the specified output file.
"""
@inline function output_fhir_types(; output_file::AbstractString,
                                     schema_string::AbstractString,
                                     fhir_release::AbstractString,
                                     additional_mappings::AbstractDict{Symbol, String} = Dict{Symbol, String}())::String
    output_file_abspath = convert(String, abspath(output_file))::String
    content = strip(generate_fhir_types_content(; schema_string = schema_string, fhir_release = fhir_release, additional_mappings = additional_mappings))
    rm(output_file_abspath; force = true, recursive = true)
    mkpath(dirname(output_file_abspath))
    open(output_file_abspath, "w") do f
        println(f, content)
    end
    @info("Successfully wrote content to: $(output_file_abspath)")
    return output_file_abspath
end

@inline function generate_fhir_types_content(; schema_string::AbstractString,
                                               fhir_release::AbstractString,
                                               additional_mappings::AbstractDict{Symbol, String})::String
    schema_parsed = JSON3.read(schema_string)
    schema_definitions = schema_parsed.definitions
    all_struct_infos_unsorted = StructInformation[]
    for typename_symbol in keys(schema_definitions)
        typename_string = String(typename_symbol)
        definition = schema_definitions[typename_symbol]
        if haskey(definition, :properties)
            properties = definition[:properties]
            if :resourceType in keys(properties)
                is_resource = true
            else
                is_resource = false
            end
            struct_field_names = String[]
            struct_field_lines = String[]
            struct_dependencies = String[]
            for propertyname_symbol in keys(properties)
                property_info = properties[propertyname_symbol]
                property_field_type, property_field_eltype = _determine_field_type(propertyname_symbol, property_info; additional_mappings = additional_mappings)
                if lowercase(strip(property_field_type)) == "number" || lowercase(strip(property_field_eltype)) == "number"
                    @error("\"number\" is too vague of a field type", typename_symbol, propertyname_symbol, property_field_type, property_field_eltype)
                    throw(ArgumentError("field type is too vague"))
                end
                if isempty(property_field_eltype)
                    if !(property_field_type in _already_defined_types)
                        push!(struct_dependencies, property_field_type)
                    end
                else
                    if !(property_field_eltype in _already_defined_types)
                        push!(struct_dependencies, property_field_eltype)
                    end
                end
                if property_field_eltype == "string"
                    @info("", typename_symbol, propertyname_symbol, property_field_type, property_field_eltype)
                end
                push!(struct_field_names, "$(propertyname_symbol)")
                push!(struct_field_lines, "$(propertyname_symbol)::Union{$(property_field_type), Nothing}")
            end
            unique!(struct_field_lines)
            unique!(struct_dependencies)
            sort!(struct_field_lines)
            sort!(struct_dependencies)
            struct_info = StructInformation(;
                typename_symbol = typename_symbol,
                is_resource = is_resource,
                struct_field_names = struct_field_names,
                struct_field_lines = struct_field_lines,
                struct_dependencies = struct_dependencies,
            )
            push!(all_struct_infos_unsorted, struct_info)
        else
            fhirname = string(typename_symbol)
            if has_julia_name(fhirname)
                julianame = fhir_to_julia(fhirname)
            else
                throw(ArgumentError("The FHIR name \"$(fhirname)\" does not have a corresponding Julia name"))
            end
        end
    end
    all_struct_infos_sorted = _sort_struct_infos(all_struct_infos_unsorted)
    struct_strings = _to_string.(all_struct_infos_sorted)
    lines = String[]
    push!(lines, "module $(fhir_release)Types")
    push!(lines, strip(preamble))
    push!(lines, strip(join(struct_strings, "\n\n")))
    push!(lines, "end # end module R4Types")
    result = join(lines, "\n\n")
    final_result = convert(String, strip(result))::String
    return final_result
end

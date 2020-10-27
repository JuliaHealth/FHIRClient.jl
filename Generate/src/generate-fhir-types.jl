import .JSON3

const preamble = """
import Dates
import .JSON3
import SaferIntegers
import StructTypes
import TimeZones

abstract type AbstractFHIRType
end

export AbstractResource

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

struct FHIRDateTime <: AbstractFHIRType
    value::String
end
@inline Base.getindex(x::FHIRDateTime) = x.value::String
@inline StructTypes.StructType(::Type{T}) where {T <: FHIRDateTime} = JSON3.RawType()
@inline StructTypes.construct(::Type{T}, x::JSON3.RawValue) where {T <: FHIRDateTime} = FHIRDateTime(unsafe_string(pointer(x.bytes, x.pos), x.len))
@inline JSON3.rawbytes(x::FHIRDateTime) = codeunits(x.value)

abstract type AbstractContainer{T} <: AbstractFHIRType
end

struct ResourceList
end
"""

@inline function _is_already_defined(julianame::String)::Bool
    _already_defined_types = String[
        "DateTime",
        "FHIRInt32",
        "ZonedDateTime",
        "ResourceList",
    ]
    if julianame in _already_defined_types || julianame in values(FHIR_TYPE_MAP)
        return true
    else
        return false
    end
end

@inline function _determine_field_type(propertyname_symbol::Symbol,
                                       property_info::AbstractDict;
                                       additional_mappings::AbstractDict{Symbol, String},
                                       typename_string::String)::Tuple{String, String, String}
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
        return "String", "String", "\"$(typename_string)\""
    elseif propertyname_symbol in haskey(additional_mappings, propertyname_symbol)
        mapped_to_type = convert(String, additional_mappings[propertyname_symbol])::String
        return mapped_to_type
    elseif propertyname_symbol in  these_map_to_fhirint32
        return "FHIRInt32", "Union{FHIRInt32, Nothing}", "nothing"
    elseif propertyname_symbol in these_map_to_fhirnumber
        return "FHIRNumber", "Union{FHIRNumber, Nothing}", "nothing"
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
                array_eltype = get_juliatype_maybe(String(m[1]))::String
            end
            if _is_already_defined(array_eltype)
                array_eltype_abstractified = array_eltype
            else
                array_eltype_abstractified = "Abstract$(array_eltype)"
            end
            return "Vector{$(array_eltype_abstractified)}", "Vector{$(array_eltype_abstractified)}", "$(array_eltype_abstractified)[]"
        else
            property_field_type = _single_typestring_to_property_field_type(property_info[:type])
            if _is_already_defined(property_field_type)
                property_field_type_abstractified = property_field_type
            else
                property_field_type_abstractified = "Abstract$(property_field_type)"
            end
            return property_field_type_abstractified, "Union{$(property_field_type_abstractified), Nothing}", "nothing"
        end
    elseif haskey(property_info, Symbol("\$ref"))
        refvalue = property_info[Symbol("\$ref")]
        m = match(definitions_regex, refvalue)
        typestring = String(get_juliatype_maybe(m[1]))::String
        property_field_type = _single_typestring_to_property_field_type(typestring)
        if _is_already_defined(property_field_type)
            property_field_type_abstractified = property_field_type
        else
            property_field_type_abstractified = "Abstract$(property_field_type)"
        end
        return property_field_type_abstractified, "Union{$(property_field_type_abstractified), Nothing}", "nothing"
    elseif haskey(property_info, "enum")
        return "String", "Union{String, Nothing}", "nothing"
    end
    throw(ArgumentError("unknown field: $(propertyname_symbol)"))
end

@inline function _single_typestring_to_property_field_type(typestring::String)::String
    if has_julia_type(typestring)
        return get_juliatype(typestring)::String
    else
        return typestring
    end
end

"""
    output_fhir_types(; output_file, schema_string)

Generate the FHIR types and save them in the specified output file.
"""
@inline function output_fhir_types(; output_file::AbstractString,
                                     schema_string::AbstractString,
                                     additional_mappings::AbstractDict{Symbol, String} = Dict{Symbol, String}())::String
    output_file_abspath = convert(String, abspath(output_file))::String
    content = strip(generate_fhir_types_content(; schema_string = schema_string, additional_mappings = additional_mappings))
    rm(output_file_abspath; force = true, recursive = true)
    mkpath(dirname(output_file_abspath))
    open(output_file_abspath, "w") do f
        println(f, content)
    end
    @info("Successfully wrote content to: $(output_file_abspath)")
    return output_file_abspath
end

@inline function generate_fhir_types_content(; schema_string::AbstractString,
                                               additional_mappings::AbstractDict{Symbol, String})::String
    schema_parsed = JSON3.read(schema_string)
    schema_definitions = schema_parsed.definitions
    struct_infos = StructInformation[]
    abstract_types = String[]
    export_list = String[]
    structtypes_subtype_statements = String[]
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
            for propertyname_symbol in keys(properties)
                propertyname_symbol_fixed = fhir_to_julia(propertyname_symbol)
                @assert julia_to_fhir(propertyname_symbol_fixed) == propertyname_symbol
                property_info = properties[propertyname_symbol]
                property_field_type, property_field_type_withunion, default_value = _determine_field_type(
                    propertyname_symbol_fixed,
                    property_info;
                    additional_mappings = additional_mappings,
                    typename_string = typename_string,
                )
                if lowercase(strip(property_field_type)) == "number"
                    @error("\"number\" is too vague of a field type", typename_symbol, propertyname_symbol, propertyname_symbol_fixed, property_field_type, property_field_eltype)
                    throw(ArgumentError("field type is too vague"))
                end
                if strip(property_field_type) == "string"
                    @error("\"string\" is too vague of a field type", typename_symbol, propertyname_symbol, propertyname_symbol_fixed, property_field_type, property_field_eltype)
                    throw(ArgumentError("field type is too vague"))
                end
                push!(struct_field_names, "$(propertyname_symbol_fixed)")
                push!(struct_field_lines, "$(propertyname_symbol_fixed)::$(property_field_type_withunion) = $(default_value)")
            end
            unique!(struct_field_lines)
            sort!(struct_field_lines)
            typename_string = String(typename_symbol)::String
            struct_supertype = "Abstract$(typename_string)"
            if is_resource
                parent_of_abstract_type = "AbstractResource"
                push!(export_list, typename_string)
            else
                parent_of_abstract_type = "AbstractFHIRType"
            end
            abstract_type_definition = "abstract type $(struct_supertype) <: $(parent_of_abstract_type) end"
            abstract_type_structtype = "@inline StructTypes.StructType(::Type{T}) where {T <: $(struct_supertype)} = StructTypes.AbstractType()"
            abstract_type_subtypes = "StructTypes.subtypes(::Type{T}) where {T <: $(struct_supertype)} = ($(typename_string)=$(typename_string),)"
            push!(abstract_types, abstract_type_definition)
            push!(abstract_types, abstract_type_structtype)
            push!(structtypes_subtype_statements, abstract_type_subtypes)
            struct_info = StructInformation(;
                typename_symbol = typename_symbol,
                typename_string = typename_string,
                struct_supertype = struct_supertype,
                struct_field_names = struct_field_names,
                struct_field_lines = struct_field_lines,
            )
            push!(struct_infos, struct_info)
        else
            fhirtype = string(typename_symbol)
            if has_julia_type(fhirtype)
                juliatype = get_juliatype(fhirtype)
            else
                throw(ArgumentError("The FHIR name \"$(fhirtype)\" does not have a corresponding Julia name"))
            end
        end
    end
    struct_strings = _to_string.(struct_infos)
    lines = String[]
    export_list
    push!(lines, strip(preamble))
    append!(lines, ["export $(x)" for x in export_list])
    push!(lines, strip(join(abstract_types, "\n\n")))
    push!(lines, strip(join(struct_strings, "\n\n")))
    push!(lines, strip(join(structtypes_subtype_statements, "\n\n")))
    result = join(lines, "\n\n")
    final_result = convert(String, strip(result))::String
    return final_result
end

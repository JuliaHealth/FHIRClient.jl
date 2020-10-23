Base.@kwdef struct StructInformation
    typename_symbol::Symbol
    is_resource::Bool
    struct_field_names::Vector{String}
    struct_field_lines::Vector{String}
    struct_dependencies::Vector{String}
end

@inline function _to_string(struct_info::StructInformation)
    typename_symbol = struct_info.typename_symbol
    is_resource = struct_info.is_resource
    struct_field_names = struct_info.struct_field_names
    struct_field_lines = struct_info.struct_field_lines

    typename_string = String(typename_symbol)::String
    if is_resource
        struct_supertype = "AbstractResource"
    else
        struct_supertype = "AbstractFHIRType"
    end
    lines = String[]
    push!(lines, "mutable struct $(typename_string) <: $(struct_supertype)")
    for struct_field_line in struct_field_lines
        push!(lines, "    $(struct_field_line)")
    end
    push!(lines, "end")
    push!(lines, "@inline StructTypes.StructType(::Type{T}) where {T <: $(typename_string)} = StructTypes.Mutable()")
    if isempty(struct_field_names)
        omitempties_rhs = "()"
    else
        colon_struct_field_names = [":$(name)" for name in struct_field_names]
        omitempties_rhs = "(" * join(colon_struct_field_names,",") * ",)"
    end
    # omitempties_rhs = "true"
    push!(lines, "@inline StructTypes.omitempties(::Type{T}) where {T <: $(typename_string)} = $(omitempties_rhs)")
    result = strip(join(lines, "\n")) * "\n\n"
    return result
end

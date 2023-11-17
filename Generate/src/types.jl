Base.@kwdef struct StructInformation
    typename_symbol::Symbol
    typename_string::String
    struct_supertype::String
    struct_field_names::Vector{String}
    struct_field_lines::Vector{String}
end

@inline function _to_string(struct_info::StructInformation)
    typename_symbol = struct_info.typename_symbol
    typename_string = struct_info.typename_string
    struct_supertype = struct_info.struct_supertype
    struct_field_names = struct_info.struct_field_lines
    struct_field_lines = struct_info.struct_field_lines

    lines = String[]
    push!(lines, "Base.@kwdef mutable struct $(typename_string) <: $(struct_supertype)")
    for struct_field_line in struct_field_lines
        push!(lines, "    $(struct_field_line)")
    end
    push!(lines, "end")
    push!(
        lines,
        "@inline StructTypes.StructType(::Type{T}) where {T <: $(typename_string)} = StructTypes.Mutable()",
    )
    push!(
        lines,
        "# @inline StructTypes.omitempties(::Type{T}) where {T <: $(typename_string)} = true",
    )
    result = strip(join(lines, "\n")) * "\n\n"
    return result
end

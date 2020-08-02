using JSON3
using Serialization
using StructTypes

function _json_to_struct(json::JSON3.Object, ::Type{T})::T where T
    return JSON3.read(JSON3.write(json), T)
end

function _struct_to_json(object::T) where T
    return JSON3.read(JSON3.write(a))
end


function _serialize_to_string(object)::String
    io = IOBuffer()
    serialize(io, object)
    return String(take!(io))
end

function _isequal_under_serialization(a::T, b::T)::Bool where T
    a_serialized = _serialize_to_string(a)
    b_serialized = _serialize_to_string(b)
    return a_serialized == b_serialized
end

function _isequal_recursive(a::T, b::T)::Bool where T
    if isstructtype(T)
        if T.mutable
            return all([_isequal_recursive(getfield(a, name), getfield(b, name)) for name in fieldnames(T)])
        else
            return a == b
        end
    else
        return a == b
    end
end

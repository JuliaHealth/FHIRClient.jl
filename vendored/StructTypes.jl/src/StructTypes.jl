module StructTypes

using UUIDs, Dates

abstract type StructType end

struct NoStructType <: StructType end

abstract type DataType <: StructType end

struct Struct <: DataType end

struct Mutable <: DataType end

StructType(u::Union) = Struct()
StructType(::Type{Any}) = Struct()
StructType(::Type{T}) where {T} = NoStructType()
StructType(x::T) where {T} = StructType(T)

function names end

names(x::T) where {T} = names(T)
names(::Type{T}) where {T} = ()

Base.@pure function julianame(names::Tuple{Vararg{Tuple{Symbol, Symbol}}}, serializationname::Symbol)
    for nm in names
        nm[2] === serializationname && return nm[1]
    end
    return serializationname
end

Base.@pure julianame(names::Tuple{}, serializationname::Int) = serializationname

Base.@pure function serializationname(names::Tuple{Vararg{Tuple{Symbol, Symbol}}}, julianame::Symbol)
    for nm in names
        nm[1] === julianame && return nm[2]
    end
    return julianame
end

Base.@pure serializationname(names::Tuple{}, julianame::Int) = julianame

function excludes end

excludes(x::T) where {T} = excludes(T)
excludes(::Type{T}) where {T} = ()

function omitempties end

omitempties(x::T) where {T} = omitempties(T)
omitempties(::Type{T}) where {T} = ()

function isempty end

isempty(x::Union{AbstractDict, AbstractArray, AbstractString, Tuple, NamedTuple}) = Base.isempty(x)
isempty(::Number) = false
isempty(::Nothing) = true
isempty(x) = false
isempty(x, i) = isempty(Core.getfield(x, i))
isempty(::Type{T}, x) where {T} = isempty(x) # generic fallback
isempty(::Type{T}, x, i) where {T} = isempty(T, Core.getfield(x, i)) # generic fallback

function keywordargs end

keywordargs(x::T) where {T} = keywordargs(T)
keywordargs(::Type{T}) where {T} = NamedTuple()

function idproperty end

idproperty(x::T) where {T} = idproperty(T)
idproperty(::Type{T}) where {T} = :_

function fieldprefix end

Base.@pure fieldprefix(::Type{T}, nm::Symbol) where {T} = Symbol(nm, :_)

abstract type InterfaceType end

function construct end

struct DictType <: InterfaceType end

StructType(::Type{<:AbstractDict}) = DictType()
StructType(::Type{<:NamedTuple}) = DictType()
StructType(::Type{<:Pair}) = DictType()

keyvaluepairs(x) = pairs(x)
keyvaluepairs(x::Pair) = (x,)

construct(::Type{Dict{K, V}}, x::Dict{K, V}; kw...) where {K, V} = x
construct(T, x::Dict{K, V}; kw...) where {K, V} = T(x)

construct(::Type{NamedTuple}, x::Dict; kw...) = NamedTuple{Tuple(keys(x))}(values(x))
construct(::Type{NamedTuple{names}}, x::Dict; kw...) where {names} = NamedTuple{names}(Tuple(x[nm] for nm in names))
construct(::Type{NamedTuple{names, types}}, x::Dict; kw...) where {names, types} = NamedTuple{names, types}(Tuple(x[nm] for nm in names))

struct ArrayType <: InterfaceType end

StructType(::Type{<:AbstractArray}) = ArrayType()
StructType(::Type{<:AbstractSet}) = ArrayType()
StructType(::Type{<:Tuple}) = ArrayType()

construct(T, x::Vector{S}; kw...) where {S} = T(x)

struct StringType <: InterfaceType end

StructType(::Type{<:AbstractString}) = StringType()
StructType(::Type{Symbol}) = StringType()
StructType(::Type{<:Enum}) = StringType()
StructType(::Type{<:AbstractChar}) = StringType()
StructType(::Type{UUID}) = StringType()
StructType(::Type{T}) where {T <: Dates.TimeType} = StringType()

function construct(::Type{Char}, str::String; kw...)
    if length(str) == 1
        return Char(str[1])
    else
        throw(ArgumentError("invalid conversion from string to Char: '$str'"))
    end
end

_symbol(ptr, len) = ccall(:jl_symbol_n, Ref{Symbol}, (Ptr{UInt8}, Int), ptr, len)

construct(::Type{E}, ptr::Ptr{UInt8}, len::Int) where {E <: Enum} = construct(E, _symbol(ptr, len))
construct(::Type{E}, str::String) where {E <: Enum} = construct(E, Symbol(str))

function construct(::Type{E}, sym::Symbol) where {E <: Enum}
    @static if VERSION < v"1.2.0-DEV.272"
        Core.eval(parentmodule(E), sym)
    else
        for (k, v) in Base.Enums.namemap(E)
            sym == v && return E(k)
        end
        throw(ArgumentError("invalid $E string value: \"$sym\""))
    end
end

construct(T, str::String; kw...) = T(str)
construct(T, ptr::Ptr{UInt8}, len::Int; kw...) = construct(T, unsafe_string(ptr, len); kw...)
construct(::Type{Symbol}, ptr::Ptr{UInt8}, len::Int; kw...) = _symbol(ptr, len)
construct(::Type{T}, str::String; dateformat::Dates.DateFormat=Dates.default_format(T), kw...) where {T <: Dates.TimeType} = T(str, dateformat)

struct NumberType <: InterfaceType end

StructType(::Type{<:Unsigned}) = NumberType()
StructType(::Type{<:Signed}) = NumberType()
StructType(::Type{<:AbstractFloat}) = NumberType()
numbertype(::Type{T}) where {T <: Real} = T
numbertype(x) = Float64
construct(T, x::Real; kw...) = T(x)

struct BoolType <: InterfaceType end

StructType(::Type{Bool}) = BoolType()
construct(T, bool::Bool; kw...) = T(bool)

struct NullType <: InterfaceType end

StructType(::Type{Nothing}) = NullType()
StructType(::Type{Missing}) = NullType()
construct(T, ::Nothing; kw...) = T()

struct AbstractType <: StructType end

subtypekey(x::T) where {T} = subtypekey(T)
subtypekey(::Type{T}) where {T} = :type
subtypes(x::T) where {T} = subtypes(T)
subtypes(::Type{T}) where {T} = NamedTuple()

# helper functions for type-stable reflection while operating on struct fields

@inline function construct(f, ::Type{T}) where {T}
    N = fieldcount(T)
    nms = names(T)
    kwargs = keywordargs(T)
    constructor = T <: Tuple ? tuple : T
    # unroll first 32 fields
    Base.@nexprs 32 i -> begin
        k_i = fieldname(T, i)
        if haskey(kwargs, k_i)
            x_i = f(i, serializationname(nms, k_i), fieldtype(T, i); kwargs[k_i]...)
        else
            x_i = f(i, serializationname(nms, k_i), fieldtype(T, i))
        end
        if N == i
            return Base.@ncall(i, constructor, x)
        end
    end
    vals = []
    for i = 33:N
        k_i = fieldname(T, i)
        if haskey(kwargs, k_i)
            x_i = f(i, serializationname(nms, k_i), fieldtype(T, i); kwargs[k_i]...)
        else
            x_i = f(i, serializationname(nms, k_i), fieldtype(T, i))
        end
        push!(vals, x_i)
    end
    return constructor(x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10, x_11, x_12, x_13, x_14, x_15, x_16,
             x_17, x_18, x_19, x_20, x_21, x_22, x_23, x_24, x_25, x_26, x_27, x_28, x_29, x_30, x_31, x_32, vals...)
end

Base.@pure function symbolin(names::Union{Tuple{Vararg{Symbol}}, Bool}, name::Symbol)
    if names === true
        return true
    elseif names === false
        return false
    end
    for nm in names
        nm === name && return true
    end
    return false
end

@inline function foreachfield(f, x::T) where {T}
    N = fieldcount(T)
    excl = excludes(T)
    nms = names(T)
    kwargs = keywordargs(T)
    emp = omitempties(T)
    Base.@nexprs 32 i -> begin
        k_i = fieldname(T, i)
        if !symbolin(excl, k_i) && isdefined(x, i)
            v_i = Core.getfield(x, i)
            if !symbolin(emp, k_i) || !isempty(T, x, i)
                if haskey(kwargs, k_i)
                    f(i, serializationname(nms, k_i), fieldtype(T, i), v_i; kwargs[k_i]...)
                else
                    f(i, serializationname(nms, k_i), fieldtype(T, i), v_i)
                end
            end
        end
        N == i && @goto done
    end
    if N > 32
        for i = 33:N
            k_i = fieldname(T, i)
            if !symbolin(excl, k_i) && isdefined(x, i)
                v_i = Core.getfield(x, i)
                if !symbolin(emp, k_i) || !isempty(T, x, i)
                    if haskey(kwargs, k_i)
                        f(i, serializationname(nms, k_i), fieldtype(T, i), v_i; kwargs[k_i]...)
                    else
                        f(i, serializationname(nms, k_i), fieldtype(T, i), v_i)
                    end
                end
            end
        end
    end

@label done
    return
end

@inline function mapfields!(f, x::T) where {T}
    N = fieldcount(T)
    excl = excludes(T)
    nms = names(T)
    kwargs = keywordargs(T)
    Base.@nexprs 32 i -> begin
        k_i = fieldname(T, i)
        if !symbolin(excl, k_i)
            if haskey(kwargs, k_i)
                setfield!(x, k_i, f(i, serializationname(nms, k_i), fieldtype(T, i); kwargs[k_i]...))
            else
                setfield!(x, k_i, f(i, serializationname(nms, k_i), fieldtype(T, i)))
            end
        end
        N == i && @goto done
    end
    if N > 32
        for i = 33:N
            k_i = fieldname(T, i)
            if !symbolin(excl, k_i)
                if haskey(kwargs, k_i)
                    setfield!(x, k_i, f(i, serializationname(nms, k_i), fieldtype(T, i); kwargs[k_i]...))
                else
                    setfield!(x, k_i, f(i, serializationname(nms, k_i), fieldtype(T, i)))
                end
            end
        end
    end

@label done
    return
end

@inline function applyfield!(f, x::T, nm::Symbol) where {T}
    N = fieldcount(T)
    excl = excludes(T)
    nms = names(T)
    kwargs = keywordargs(T)
    nm = julianame(nms, nm)
    f_applied = false
    # unroll the first 32 field checks to avoid dynamic dispatch if possible
    Base.@nif(
        33,
        i -> (i <= N && fieldname(T, i) === nm && !symbolin(excl, nm)),
        i -> begin
            FT_i = fieldtype(T, i)
            if haskey(kwargs, nm)
                y_i = f(i, nm, FT_i; kwargs[nm]...)
            else
                y_i = f(i, nm, FT_i)
            end
            setfield!(x, i, y_i)
            f_applied = true
        end,
        i -> begin
            for j in 33:N
                (fieldname(T, j) === nm && !symbolin(excl, nm)) || continue
                FT_j = fieldtype(T, j)
                if haskey(kwargs, nm)
                    y_j = f(j, nm, FT_j; kwargs[nm]...)
                else
                    y_j = f(j, nm, FT_j)
                end
                setfield!(x, j, y_j)
                f_applied = true
                break
            end
        end
    )
    return f_applied
end

makeobj(::Type{Any}, obj) = obj

makeobj(::Type{Any}, obj::AbstractDict) = obj

makeobj(::Type{T}, obj) where {T <: Any} = convert(T, obj)::T

makeobj(::Type{T}, obj::AbstractDict) where {T <: AbstractDict} = convert(T, obj)::T

function makeobj(::Type{T}, obj::AbstractDict) where {T}
    x = T()
    makeobj!(x, obj)
    return x
end

function makeobj!(x::T, obj::AbstractDict) where {T}
    for (k, v) in obj
        if hasfield(T, k)
            setfield!(x, k, makeobj(fieldtype(T, k), v))
        end
    end
    return x
end

end # module

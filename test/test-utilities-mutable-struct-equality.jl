function _mutable_struct_equality(a::T, b::T)::Bool where T
    if isstructtype(T) && T.mutable
        T_fieldnames = fieldnames(T)
        T_num_fieldnames = length(T_fieldnames)
        temp_vector = Vector{Bool}(undef, T_num_fieldnames)
        for i in 1:T_num_fieldnames
            name_i = T_fieldnames[i]
            temp_vector[i] = _mutable_struct_equality(getfield(a, name_i), getfield(b, name_i))
        end
        return all(temp_vector)
    else
        return a == b
    end
end

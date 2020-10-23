import SimplePosets

@inline function _sort_struct_infos(struct_infos_unsorted)
    structname_to_structinfo = Dict{String, StructInformation}()

    for struct_info in struct_infos_unsorted
        typename_symbol = struct_info.typename_symbol
        typename_string = String(typename_symbol)::String
        structname_to_structinfo[typename_string] = struct_info
    end

    poset = SimplePosets.SimplePoset(StructInformation)

    for struct_info in struct_infos_unsorted
        SimplePosets.add!(poset, struct_info)
    end

    for struct_info in struct_infos_unsorted
        typename_symbol = struct_info.typename_symbol
        typename_string = String(typename_symbol)::String
        struct_dependencies = struct_info.struct_dependencies
        for dependency in struct_dependencies
            if !haskey(structname_to_structinfo, dependency)
                @info typename_symbol dependency struct_dependencies
            end
            x = structname_to_structinfo[dependency]
            y = struct_info
            # @info("$(x.typename_symbol)<$(y.typename_symbol)")
            SimplePosets.add!(poset, x, y) # || @error("Could not add: $(x.typename_symbol)<$(y.typename_symbol)")
        end
    end

    struct_infos_sorted = deepcopy(SimplePosets.linear_extension(poset))
    return struct_infos_sorted
end

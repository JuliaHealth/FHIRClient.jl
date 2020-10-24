@inline function fhir_to_julia(fhirname::Symbol)
    if fhirname == :end
        return :end_fhir
    elseif fhirname == :function
            return :function_fhir
    elseif fhirname == :global
            return :global_fhir
    elseif fhirname == :import
            return :import_fhir
    elseif fhirname == :for
            return :for_fhir
    else
        return fhirname
    end
end

@inline function julia_to_fhir(julianame::Symbol)
    if julianame == :end_fhir
        return :end
    elseif julianame == :function_fhir
            return :function
    elseif julianame == :global_fhir
            return :global
    elseif julianame == :import_fhir
            return :import
    elseif julianame == :for_fhir
            return :for
    else
        return julianame
    end
end

import JSON3

"""
"""
@inline function generate_fhir_types(schema_string::AbstractString)
    schema_parsed = JSON3.read(schema_string)
    definitions = schema_parsed.definitions
    for key in keys(definitions)
        definition = definitions[key]
        if haskey(definition, :properties)
            properties = definition[:properties]
        else
            fhirname = string(key)
            if has_julia_name(fhirname)
                julianame = fhir_to_julia(fhirname)
            else
                throw(ArgumentError("The FHIR name \"$(fhirname)\" does not have a corresponding Julia name"))
            end
        end
    end
    return schema_parsed
end

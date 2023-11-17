const FHIR_TYPE_MAP = Dict{String,String}(
    "ResourceList" => "ResourceList",
    "base64Binary" => "String",
    "boolean" => "Bool",
    "canonical" => "String",
    "code" => "String",
    "date" => "Date",
    "dateTime" => "FHIRDateTime",
    "decimal" => "FHIRNumber",
    "id" => "String",
    "instant" => "ZonedDateTime",
    "integer" => "SafeInt32",
    "markdown" => "String",
    "oid" => "String",
    "positiveInt" => "SafeInt32",
    "string" => "String",
    "time" => "Time",
    "unsignedInt" => "SafeInt32",
    "uri" => "String",
    "url" => "String",
    "uuid" => "String",
    "xhtml" => "String",
)

@inline function has_julia_type(fhirtype::AbstractString)
    return (fhirtype in collect(keys(FHIR_TYPE_MAP)))::Bool
end

@inline function get_juliatype(fhirtype::AbstractString)
    if fhirtype in collect(keys(FHIR_TYPE_MAP))
        return FHIR_TYPE_MAP[fhirtype]::String
    end
    throw(KeyError("\"$(fhirtype)\" not found"))
end

@inline function get_juliatype_maybe(fhirtype::AbstractString)
    if fhirtype in collect(keys(FHIR_TYPE_MAP))
        return FHIR_TYPE_MAP[fhirtype]::String
    end
    return fhirtype
end

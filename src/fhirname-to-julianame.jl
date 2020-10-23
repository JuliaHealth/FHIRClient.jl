import Bijections
import Dates
import SaferIntegers
import TimeZones

const Date = Dates.Date
const DateTime = Dates.DateTime
const SafeInt32 = SaferIntegers.SafeInt32
const Time = Dates.Time
const ZonedDateTime = TimeZones.ZonedDateTime
const string_fhir = String

const FHIR_TO_JULIA_BIJECTIVE = Bijections.Bijection(
    Dict{String, String}(
        "string"          => "string_fhir",
    )
)

const FHIR_TO_JULIA_NONBIJECTIVE = Dict{String, String}(
    "BigFloat"     => "FHIRNumber",
    "Narrative"    => "String",
    "ResourceList" => "ResourceList",
    "base64Binary" => "String",
    "boolean"      => "Bool",
    "canonical"    => "String",
    "code"         => "String",
    "date"         => "Date",
    "dateTime"     => "Union{DateTime, ZonedDateTime}",
    "decimal"      => "BigFloat",
    "id"           => "String",
    "instant"      => "Union{DateTime, ZonedDateTime}",
    "integer"      => "SafeInt32",
    "markdown"     => "String",
    "oid"          => "String",
    "positiveInt"  => "SafeInt32",
    "time"         => "Time",
    "unsignedInt"  => "SafeInt32",
    "uri"          => "String",
    "url"          => "String",
    "uuid"         => "String",
    "xhtml"        => "String",
)

@inline function has_julia_name(fhirname::AbstractString)
    return ((fhirname in collect(keys(FHIR_TO_JULIA_BIJECTIVE))) || (fhirname in collect(keys(FHIR_TO_JULIA_NONBIJECTIVE))))::Bool
end

@inline function has_fhir_name(julianame::AbstractString)
    return (julianame in collect(values(FHIR_TO_JULIA_BIJECTIVE)))::Bool
end

@inline function fhir_to_julia(fhirname::AbstractString)
    if fhirname in collect(keys(FHIR_TO_JULIA_BIJECTIVE))
        return FHIR_TO_JULIA_BIJECTIVE[fhirname]::String
    elseif fhirname in collect(keys(FHIR_TO_JULIA_NONBIJECTIVE))
        return FHIR_TO_JULIA_NONBIJECTIVE[fhirname]::String
    end
    throw(KeyError("\"$(fhirname)\" not found"))
end

@inline function julia_to_fhir(julianame::AbstractString)
    if julianame in collect(values(FHIR_TO_JULIA_BIJECTIVE))
        return Bijections.inverse(FHIR_TO_JULIA_BIJECTIVE, julianame)::String
    end
    throw(KeyError("\"$(julianame)\" not found"))
end

@inline function fhir_to_julia_maybe(fhirname::AbstractString)
    if fhirname in collect(keys(FHIR_TO_JULIA_BIJECTIVE))
        return FHIR_TO_JULIA_BIJECTIVE[fhirname]::String
    elseif fhirname in collect(keys(FHIR_TO_JULIA_NONBIJECTIVE))
        return FHIR_TO_JULIA_NONBIJECTIVE[fhirname]::String
    end
    return fhirname
end

@inline function julia_to_fhir_maybe(julianame::AbstractString)
    if julianame in collect(values(FHIR_TO_JULIA_BIJECTIVE))
        return Bijections.inverse(FHIR_TO_JULIA_BIJECTIVE, julianame)::String
    end
    return julianame
end

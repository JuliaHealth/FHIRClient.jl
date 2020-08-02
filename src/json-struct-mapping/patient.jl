import StructTypes

Base.@kwdef mutable struct FHIRMeta <: FHIRType
    versionId::Union{String, Missing} = missing
    lastUpdated::Union{String, Missing} = missing
    source::Union{String, Missing} = missing
end

Base.@kwdef mutable struct FHIRText <: FHIRType
    status::Union{String, Missing} = missing
    div::Union{String, Missing} = missing
end

Base.@kwdef mutable struct FHIRCoding <: FHIRType
    system::Union{String, Missing} = missing
    code::Union{String, Missing} = missing
    display::Union{String, Missing} = missing
end

Base.@kwdef mutable struct FHIRCodeableConcept <: FHIRType
    coding::Union{Vector{FHIRCoding}, Missing} = missing
    text::Union{String, Missing} = missing
end

Base.@kwdef mutable struct FHIRExtension <: FHIRType
    url::Union{String, Missing} = missing
    valueCodeableConcept::Union{FHIRCodeableConcept, Missing} = missing
end

Base.@kwdef mutable struct FHIRIdentifier <: FHIRType
    use::Union{String, Missing} = missing
    system::Union{String, Missing} = missing
    value::Union{String, Missing} = missing
end

Base.@kwdef mutable struct FHIRName <: FHIRType
    use::Union{String, Missing} = missing
    text::Union{String, Missing} = missing
    family::Union{String, Missing} = missing
    given::Union{Vector{String}, Missing} = missing
end

Base.@kwdef mutable struct FHIRAddress <: FHIRType
    use::Union{String, Missing} = missing
    line::Union{Vector{String}, Missing} = missing
    city::Union{String, Missing} = missing
    state::Union{String, Missing} = missing
    postalCode::Union{String, Missing} = missing
    country::Union{String, Missing} = missing
end

Base.@kwdef mutable struct FHIRCommunication <: FHIRType
    use::Union{FHIRCodeableConcept, Missing} = missing
    preferred::Union{Bool, Missing} = missing
end

Base.@kwdef mutable struct FHIRGeneralPractitioner <: FHIRType
    reference::Union{String, Missing} = missing
    display::Union{String, Missing} = missing
end

Base.@kwdef mutable struct FHIRPatient <: FHIRType
    resourceType::Union{String, Missing} = missing
    id::Union{String, Missing} = missing
    meta::Union{FHIRMeta, Missing} = missing
    text::Union{FHIRText, Missing} = missing
    extension::Union{Vector{FHIRExtension}, Missing} = missing
    identifier::Union{Vector{FHIRIdentifier}, Missing} = missing
    active::Union{Bool, Missing} = missing
    name::Union{Vector{FHIRName}, Missing} = missing
    telecom::Union{Vector{FHIRCodeableConcept}, Missing} = missing
    gender::Union{String, Missing} = missing
    birthDate::Union{String, Missing} = missing
    deceasedBoolean::Union{Bool, Missing} = missing
    address::Union{Vector{FHIRAddress}, Missing} = missing
    maritalStatus::Union{FHIRCodeableConcept, Missing} = missing
    communication::Union{Vector{FHIRCommunication}, Missing} = missing
    generalPractitioner::Union{Vector{FHIRGeneralPractitioner}, Missing} = missing
end

StructTypes.StructType(::Type{FHIRMeta}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRText}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRCoding}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRCodeableConcept}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRExtension}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRIdentifier}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRName}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRAddress}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRCommunication}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRGeneralPractitioner}) = StructTypes.Mutable()
StructTypes.StructType(::Type{FHIRPatient}) = StructTypes.Mutable()

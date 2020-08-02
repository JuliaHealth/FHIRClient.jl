import HTTP
import HealthBase

abstract type Authentication end

"""
A `FHIRType` is a Julia type representation of a FHIR object.
"""
abstract type FHIRType end

"""
A struct corresponding to a version of the FHIR specification.
"""
abstract type FHIRVersion end

"""
A FHIR endpoint.
"""
struct Endpoint
    base_url::HTTP.URI
end

"""
A FHIR client.
"""
struct Client{V <: FHIRVersion, A <: Authentication} <: HealthBase.AbstractFHIRClient
    fhir_version::V
    endpoint::Endpoint
    auth::A
end

struct Credential
    secret_buffer::Base.SecretBuffer
end

struct AnonymousAuth <: Authentication end

struct JWTAuth <: Authentication
    jwt_cred::Credential
end

struct OAuth2 <: Authentication
    oauth2_cred::Credential
end

struct UsernamePassAuth <: Authentication
    username::String
    password_cred::Credential
end

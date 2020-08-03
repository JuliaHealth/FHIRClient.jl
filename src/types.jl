import HTTP
import HealthBase

abstract type Authentication end

"""
A `FHIRType` is a Julia type representation of a FHIR object.
"""
abstract type FHIRType end

"""
A struct corresponding to a release of the FHIR specification.
"""
abstract type FHIRRelease end

"""
The base URL for a FHIR server.

The base URL is also called the "Service Root URL"
"""
struct BaseURL
    uri::HTTP.URI
end

"""
A FHIR client.
"""
struct Client{R <: FHIRRelease, A <: Authentication} <: HealthBase.AbstractFHIRClient
    fhir_release::R
    base_url::BaseURL
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

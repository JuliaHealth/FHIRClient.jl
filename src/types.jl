import HTTP
import HealthBase

"""
A struct corresponding to a version of the FHIR specification.
"""
abstract type FHIRVersion end

"""
A `FHIRType` is a Julia type representation of a FHIR object.
"""
abstract type FHIRType end

"""
A FHIR endpoint.
"""
struct Endpoint
    base_url::HTTP.URI
end

"""
Construct a FHIR endpoint given the base URL.
"""
@inline Endpoint(base_url::AbstractString) = Endpoint(HTTP.URI(base_url))

@inline get_base_url(endpoint::Endpoint) = endpoint.base_url

abstract type Authentication end

"""
A FHIR client.
"""
struct Client{V <: FHIRVersion, A <: Authentication} <: HealthBase.AbstractFHIRClient
    fhir_version::V
    endpoint::Endpoint
    auth::A
end

@inline get_auth(client::Client) = client.auth
@inline get_endpoint(client::Client) = client.endpoint
@inline get_fhir_version(client::Client) = client.fhir_version

struct Credential
    str::String
end

function Base.show(io::IO, str::Credential)
    print(io, "FHIRClient.Credential(***)")
end

struct AnonymousAuth <: Authentication end

struct OAuth2 <: Authentication
    oauth2_token::Credential
end

@inline function OAuth2(oauth2_token::AbstractString)
    return OAuth2(Credential(oauth2_token))
end

struct JWTAuth <: Authentication
    jwt_token::Credential
end

@inline function JWTAuth(jwt_token::AbstractString)
    return JWTAuth(Credential(jwt_token))
end

struct UsernamePassAuth <: Authentication
    username::String
    password::Credential
end

@inline function UsernamePassAuth(username::AbstractString,
                                  password::AbstractString)
    return UsernamePassAuth(username, Credential(password))
end

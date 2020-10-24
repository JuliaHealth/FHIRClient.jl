import HTTP

"""
Supertype of the various authentication types.

## Summary
abstract type Authentication <: Any
"""
abstract type Authentication
end

"""
Subtypes of `FHIRVersion` are singleton structs that correspond to versions of the
FHIR specification.

## Summary
abstract type FHIRVersion <: Any
"""
abstract type FHIRVersion
end


"""
The base URL for a FHIR server.

The base URL is also called the "Service Root URL"

## Summary
struct BaseURL <: Any

## Fields
- uri :: HTTP.URIs.URI
"""
struct BaseURL
    uri::HTTP.URI
end
_get_http_uri(base_url::BaseURL) = base_url.uri
function _get_http_uri_string(uri::HTTP.URI)::String
    return Base.string(uri)
end

"""
    BaseURL(base_url::AbstractString)

Construct a `BaseURL` object given the base URL.

The base URL is also called the "Service Root URL"
"""
BaseURL(base_url::AbstractString) = BaseURL(HTTP.URI(base_url))


"""
A FHIR client.

## Summary
struct Client{V <: FHIRVersion, A <: Authentication} <: Any

## Fields
- fhir_version :: V
- base_url :: BaseURL
- auth :: A
"""
struct Client{V <: FHIRVersion, A <: Authentication}
    fhir_version::V
    base_url::BaseURL
    auth::A
end
get_auth(client::Client) = client.auth
get_base_url(client::Client) = client.base_url
get_fhir_version(client::Client) = client.fhir_version
function Base.shred!(client::Client)::Nothing
    Base.shred!(client.auth)
    return nothing
end

struct Credential
    secret_buffer::Base.SecretBuffer
end
Credential() = Credential(Base.SecretBuffer())

struct AnonymousAuth <: Authentication end

struct JWTAuth <: Authentication
    jwt_cred::Credential
end
JWTAuth() = JWTAuth(Credential())

struct OAuth2 <: Authentication
    oauth2_cred::Credential
end
OAuth2() = OAuth2(Credential())

struct UsernamePassAuth <: Authentication
    username::String
    password_cred::Credential
end
@inline function UsernamePassAuth(username::AbstractString)
    return UsernamePassAuth(username, Credential())
end
@inline function UsernamePassAuth(; username::AbstractString)
    return UsernamePassAuth(username, Credential())
end

"""
Supertype of the various authentication types.

## Summary
abstract type Authentication <: Any
"""
abstract type Authentication end

"""
Subtypes of `FHIRVersion` are singleton structs that correspond to versions of the
FHIR specification.

## Summary
abstract type FHIRVersion <: Any
"""
abstract type FHIRVersion end

"""
The base URL for a FHIR server.

The base URL is also called the "Service Root URL"

## Summary
struct BaseURL <: Any

## Fields
- uri :: URIs.URI
"""
struct BaseURL
    uri::URIs.URI

    """
        BaseURL(base_url::Union{URIs.URI, AbstractString})

    Construct a `BaseURL` object given the base URL.

    The base URL is also called the "Service Root URL".
    """
    function BaseURL(uri::Union{URIs.URI,AbstractString}; require_https::Bool = true)
        _uri = uri isa URIs.URI ? uri : URIs.URI(uri)
        if lowercase(_uri.scheme) != "https"
            msg = "The following FHIR Base URL does not use HTTPS: $(uri)"
            if require_https
                throw(ArgumentError(msg))
            else
                @warn "`require_https` is set to `false` - we strongly recommend setting it to `true`"
                @warn msg
            end
        end
        return new(_uri)
    end
end

"""
A FHIR client.

## Summary
struct Client{V <: FHIRVersion, A <: Authentication} <: Any

## Fields
- fhir_version :: V
- base_url :: BaseURL
- auth :: A
"""
struct Client{V<:FHIRVersion,A<:Authentication}
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

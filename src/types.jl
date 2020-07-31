import HTTP
import HealthBase

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

"""
A FHIR client.
"""
struct Client <: HealthBase.AbstractFHIRClient
    endpoint::Endpoint
end

@inline get_endpoint(client::Client) = client.endpoint

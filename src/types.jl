import HTTP
import HealthBase

"""
A `FHIRType` is a Julia type representation of a FHIR object.
"""
abstract type FHIRType end

"""
A FHIR endpoint.
"""
struct FHIREndpoint
    base_url::HTTP.URI
end

"""
Construct a FHIR endpoint given the base URL.
"""
@inline FHIREndpoint(base_url::AbstractString) = FHIREndpoint(HTTP.URI(base_url))

@inline get_base_url(endpoint::FHIREndpoint) = endpoint.base_url

"""
A FHIR client.
"""
struct FHIRClient <: HealthBase.AbstractFHIRClient
    endpoint::FHIREndpoint
end

@inline get_endpoint(client::FHIRClient) = client.endpoint

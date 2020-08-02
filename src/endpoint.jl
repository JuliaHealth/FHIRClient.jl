"""
Construct a FHIR endpoint given the base URL.
"""
Endpoint(base_url::AbstractString) = Endpoint(HTTP.URI(base_url))

get_base_url(endpoint::Endpoint) = endpoint.base_url

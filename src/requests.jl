import DocStringExtensions
import HTTP
import JSON3

function _fhir_get_raw(client::Client,
                       query::AbstractString;
                       headers::AbstractDict = Dict{String, String}())::String
    endpoint = get_endpoint(client)
    base_url = get_base_url(endpoint)
    full_url = string(base_url, query)
    new_headers = Dict{String, String}()
    json_headers!(new_headers)
    authentication_headers!(new_headers, client)
    merge!(new_headers, headers)
    r = HTTP.request("GET", full_url, new_headers)
    empty!(new_headers)
    body = String(r.body)
    return body
end

# `JSON3.read(body)`` is slower than `JSON3.read(body, T)`.
# Therefore, you should always use `fhir_get_struct` instead of `_fhir_get_json`.
# `_fhir_get_json` is really only useful for debugging.
function _fhir_get_json(client::Client,
                        query::AbstractString;
                        headers::AbstractDict = Dict{String, String}())
    body::String = _fhir_get_raw(client, query; headers = headers)::String
    json = JSON3.read(body)
    return json
end

"""
    $(DocStringExtensions.FUNCTIONNAME)(client::FHIRClient.Client, query::String, T)

Make a query and store the result in a struct of type `T`.
"""
function fhir_get_struct(client::Client,
                         query::AbstractString,
                         ::Type{T};
                         headers::AbstractDict = Dict{String, String}())::T where T
    body::String = _fhir_get_raw(client, query; headers = headers)::String
    object::T = JSON3.read(body, T)::T
    return object
end

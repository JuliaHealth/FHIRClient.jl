import HTTP
import JSON3

function fhir_get_raw(client::Client,
                      query_string::AbstractString;
                      headers = Dict{String, String}())
    endpoint = get_endpoint(client)
    base_url = get_base_url(endpoint)
    full_url = string(base_url, query_string)
    new_headers = Dict{String, String}()
    json_headers!(new_headers)
    authentication_headers!(new_headers, client)
    _headers = deepcopy(headers)
    merge!(new_headers, _headers)
    r = HTTP.request("GET", full_url, new_headers)
    body = String(r.body)
    return body
end

function fhir_get_json(client::Client,
                       query_string::AbstractString;
                       headers = Dict{String, String}())
    body = fhir_get_raw(client,
                        query_string;
                        headers = headers)
    json = JSON3.read(body)
    return json
end

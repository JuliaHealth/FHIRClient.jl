import HTTP
import JSON3

function get_unparsed_json(client::FHIRClient, query_string::AbstractString)
    endpoint = get_endpoint(client)
    base_url = get_base_url(endpoint)
    full_url = string(base_url, query_string)
    headers = [
        "Accept" => "application/json",
        "Content-Type" => "application/json",
    ]
    r = HTTP.request("GET", full_url, headers)
    body = String(r.body)
    return body
end

function get_json(client::FHIRClient, query_string::AbstractString)
    body = get_unparsed_json(client, query_string)
    json = JSON3.read(body)
    return json
end

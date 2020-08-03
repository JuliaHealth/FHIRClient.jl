get_auth(client::Client) = client.auth
get_base_url(client::Client) = client.base_url
get_fhir_release(client::Client) = client.fhir_release

function Base.shred!(client::Client)::Nothing
    Base.shred!(client.auth)
    return nothing
end

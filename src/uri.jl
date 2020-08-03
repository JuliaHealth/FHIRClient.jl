import HTTP

_get_http_uri(base_url::BaseURL) = base_url.uri

function _get_http_uri_string(uri::HTTP.URI)::String
    return Base.string(uri)
end

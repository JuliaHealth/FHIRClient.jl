import DocStringExtensions
import HTTP
import JSON3

function _assert_is_valid_http_verb(verb::AbstractString)::Nothing
    if !( _is_valid_http_verb(verb) )
        throw(ArgumentError("Not a valid HTTP verb: \"$(verb)\""))
    end
    return nothing
end

function _is_valid_http_verb(verb::AbstractString)::Bool
    if verb == "DELETE"
        return true
    elseif verb == "GET"
        return true
    elseif verb == "HEAD"
        return true
    elseif verb == "OPTIONS"
        return true
    elseif verb == "PATCH"
        return true
    elseif verb == "POST"
        return true
    elseif verb == "PUT"
        return true
    elseif verb == "TRACE"
        return true
    end
    return false
end

function _request_http(verb::AbstractString,
                       full_url::HTTP.URI,
                       headers::AbstractDict,
                       query::Nothing,
                       body::Nothing)
    response = HTTP.request(
        verb,
        full_url,
        headers,
    )
    return response
end

function _request_http(verb::AbstractString,
                       full_url::HTTP.URI,
                       headers::AbstractDict,
                       query::Nothing,
                       body::AbstractString)
    response = HTTP.request(
        verb,
        full_url,
        headers,
        body,
    )
    return response
end

function _request_http(verb::AbstractString,
                       full_url::HTTP.URI,
                       headers::AbstractDict,
                       query::AbstractDict,
                       body::Nothing)
    response = HTTP.request(
        verb,
        full_url,
        headers;
        query = query,
    )
    return response
end

function _request_http(verb::AbstractString,
                       full_url::HTTP.URI,
                       headers::AbstractDict,
                       query::AbstractDict,
                       body::AbstractString)
    response = HTTP.request(
        verb,
        full_url,
        headers,
        body;
        query = query,
    )
    return response
end

function _add_trailing_slash(url::HTTP.URI)::HTTP.URI
    _url_string = _get_http_uri_string(url)
    if endswith(_url_string, "/")
        return url
    end
    return HTTP.URI(string(_url_string, "/"))
end

function _generate_full_url(client::Client,
                            path::AbstractString)::HTTP.URI
    base_url = get_base_url(client)
    result = _generate_full_url(base_url, path)
    return result
end

function _generate_full_url(base_url::BaseURL,
                            path::AbstractString)::HTTP.URI
    base_url_uri = _get_http_uri(base_url)
    result = _generate_full_url(base_url_uri, path)
    return result
end

function _generate_full_url(base_url_uri::HTTP.URI,
                            path::AbstractString)::HTTP.URI
    base_url_uri_with_trailing_slash = _add_trailing_slash(base_url_uri)
    base_url_uri_string = _get_http_uri_string(base_url_uri_with_trailing_slash)
    full_url_uri_string = string(base_url_uri_string, path)
    full_url_uri = HTTP.URI(full_url_uri_string)
    return full_url_uri
end

function _request_raw(client::Client,
                      verb::AbstractString,
                      path::AbstractString;
                      body::Union{AbstractString, Nothing} = nothing,
                      headers::AbstractDict = Dict{String, String}(),
                      query::Union{AbstractDict, Nothing} = nothing)::String
    _assert_is_valid_http_verb(verb)
    full_url = _generate_full_url(client,
                                  path)
    _new_headers = Dict{String, String}()
    json_headers!(_new_headers)
    authentication_headers!(_new_headers, client)
    merge!(_new_headers, headers)
    response = _request_http(verb,
                             full_url,
                             _new_headers,
                             query,
                             body)
    empty!(_new_headers)
    response_body_string::String = String(response.body)::String
    return response_body_string
end

function _write_json_request_body(body::Nothing)::Nothing
    return nothing
end

function _write_json_request_body(body::JSON3.Object)::String
    body_string::String = JSON3.write(body)::String
    return body_string
end

function _request_json(client::Client,
                       verb::AbstractString,
                       path::AbstractString;
                       body::Union{JSON3.Object, Nothing} = nothing,
                       headers::AbstractDict = Dict{String, String}(),
                       query::Union{AbstractDict, Nothing} = nothing)
    _new_request_body = _write_json_request_body(body)
    response_body::String = _request_raw(client,
                                         verb,
                                         path;
                                         body = _new_request_body,
                                         headers = headers,
                                         query = query)::String
    response_json = JSON3.read(response_body)
    return response_json
end

function _write_struct_request_body(body::Nothing)::Nothing
    return nothing
end

function _write_struct_request_body(body)::String
    body_string::String = JSON3.write(body)::String
    return body_string
end

function _request(::Type{T},
                  client::Client,
                  verb::AbstractString,
                  path::AbstractString;
                  body = nothing,
                  headers::AbstractDict = Dict{String, String}(),
                  query::Union{AbstractDict, Nothing} = nothing,
                  kwargs...)::T where T
    _new_request_body = _write_struct_request_body(body)
    response_body::String = _request_raw(client,
                                         verb,
                                         path;
                                         body = _new_request_body,
                                         headers = headers,
                                         query = query)::String
    response_object::T = JSON3.read(response_body,
                                    T;
                                    kwargs...)::T
    return response_object
end

function _depagination_placeholder(x)
    return x
end

function _depagination_placeholder(::Type{T}, x) where T
    return x
end

function request_json(client::Client,
                      verb::AbstractString,
                      path::AbstractString;
                      body::Union{JSON3.Object, Nothing} = nothing,
                      headers::AbstractDict = Dict{String, String}(),
                      query::Union{AbstractDict, Nothing} = nothing,
                      kwargs...)
    response_json = _request_json(client,
                                  verb,
                                  path;
                                  body = body,
                                  headers = headers,
                                  query = query,
                                  kwargs...)
    depaginated_response_json = _depagination_placeholder(response_json)
    return depaginated_response_json
end

function request(::Type{T},
                 client::Client,
                 verb::AbstractString,
                 path::AbstractString;
                 body = nothing,
                 headers::AbstractDict = Dict{String, String}(),
                 query::Union{AbstractDict, Nothing} = nothing,
                 kwargs...)::T where T
    response_object::T = _request(T,
                                  client,
                                  verb,
                                  path;
                                  body = body,
                                  headers = headers,
                                  query = query,
                                  kwargs...)::T
    depaginated_response_object::T = _depagination_placeholder(T, response_object)::T
    return depaginated_response_object
end

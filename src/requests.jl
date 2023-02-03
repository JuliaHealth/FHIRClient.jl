@inline function _request_http(verb::AbstractString,
                               full_url::HTTP.URI,
                               headers::AbstractDict,
                               query::Nothing,
                               body::Nothing;
                               status_exception::Bool = true)
    response = HTTP.request(
        verb,
        full_url,
        headers;
        status_exception = status_exception,
    )
    return response
end

@inline function _request_http(verb::AbstractString,
                               full_url::HTTP.URI,
                               headers::AbstractDict,
                               query::Nothing,
                               body::AbstractString;
                               status_exception::Bool = true)
    response = HTTP.request(
        verb,
        full_url,
        headers,
        body;
        status_exception = status_exception,
    )
    return response
end

@inline function _request_http(verb::AbstractString,
                               full_url::HTTP.URI,
                               headers::AbstractDict,
                               query::AbstractDict,
                               body::Nothing;
                               status_exception::Bool = true)
    response = HTTP.request(
        verb,
        full_url,
        headers;
        query = query,
        status_exception = status_exception,
    )
    return response
end

@inline function _request_http(verb::AbstractString,
                               full_url::HTTP.URI,
                               headers::AbstractDict,
                               query::AbstractDict,
                               body::AbstractString;
                               status_exception::Bool = true)
    response = HTTP.request(
        verb,
        full_url,
        headers,
        body;
        query = query,
        status_exception = status_exception,
    )
    return response
end

@inline function _add_trailing_slash(url::HTTP.URI)::HTTP.URI
    _url_string = _get_http_uri_string(url)
    if endswith(_url_string, "/")
        return url
    end
    return HTTP.URI(string(_url_string, "/"))
end

@inline function _generate_full_url(client::Client, path::AbstractString)::HTTP.URI
    base_url = get_base_url(client)
    result = _generate_full_url(base_url, path)
    return result
end

@inline function _generate_full_url(base_url::BaseURL, path::AbstractString)::HTTP.URI
    base_url_uri = _get_http_uri(base_url)
    result = _generate_full_url(base_url_uri, path)
    return result
end

@inline function _generate_full_url(base_url_uri::HTTP.URI, path::AbstractString)::HTTP.URI
    base_url_uri_with_trailing_slash = _add_trailing_slash(base_url_uri)
    base_url_uri_string = _get_http_uri_string(base_url_uri_with_trailing_slash)
    full_url_uri_string = string(base_url_uri_string, path)
    full_url_uri = HTTP.URI(full_url_uri_string)
    return full_url_uri
end

"""
    request_raw(client, verb, path; query, body, headers)
    request_raw(client, verb, path; query, headers)
    request_raw(client, verb, path; body, headers)
    request_raw(client, verb, path; headers)
"""
@inline function request_raw(client::Client,
                             verb::AbstractString,
                             path::AbstractString;
                             body::Union{AbstractString, Nothing} = nothing,
                             headers::AbstractDict = Dict{String, String}(),
                             query::Union{AbstractDict, Nothing} = nothing,
                             status_exception::Bool = true)::String
    response = _request_raw_response(
        client,
        verb,
        path;
        body=body,
        headers=headers,
        query=query,
        status_exception=status_exception,
    )
    response_body_string::String = String(response.body)::String
    return response_body_string
end

@inline function _request_raw_response(client::Client,
                             verb::AbstractString,
                             path::AbstractString;
                             body::Union{AbstractString, Nothing} = nothing,
                             headers::AbstractDict = Dict{String, String}(),
                             query::Union{AbstractDict, Nothing} = nothing,
                             status_exception::Bool = true)
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
                             body;
                             status_exception = status_exception)
    empty!(_new_headers)
    return response
end

@inline function _write_json_request_body(body::Nothing)::Nothing
    return nothing
end

@inline function _write_json_request_body(body::JSON3.Object)::String
    body_string::String = JSON3.write(body)::String
    return body_string
end

"""
    request_json(client, verb, path; query, body, headers)
    request_json(client, verb, path; query, headers)
    request_json(client, verb, path; body, headers)
    request_json(client, verb, path; headers)
"""
@inline function request_json(client::Client,
                              verb::AbstractString,
                              path::AbstractString;
                              body::Union{JSON3.Object, Nothing} = nothing,
                              headers::AbstractDict = Dict{String, String}(),
                              query::Union{AbstractDict, Nothing} = nothing,
                              status_exception::Bool = true)
    _new_request_body = _write_json_request_body(body)
    response_body::String = request_raw(client,
                                        verb,
                                        path;
                                        body = _new_request_body,
                                        headers = headers,
                                        query = query,
                                        status_exception = status_exception)::String
    response_json = JSON3.read(response_body)
    return response_json
end

@inline function _write_struct_request_body(body::Nothing)::Nothing
    return nothing
end

@inline function _write_struct_request_body(body)::String
    body_string::String = JSON3.write(body)::String
    return body_string
end

"""
    request(T, client, verb, path; query, body, headers, kwargs...)
    request(T, client, verb, path; query, headers, kwargs...)
    request(T, client, verb, path; body, headers, kwargs...)
    request(T, client, verb, path; headers, kwargs...)
"""
@inline function request(::Type{T},
                         client::Client,
                         verb::AbstractString,
                         path::AbstractString;
                         body = nothing,
                         headers::AbstractDict = Dict{String, String}(),
                         query::Union{AbstractDict, Nothing} = nothing,
                         status_exception::Bool = true,
                         kwargs...)::T where T
    _new_request_body = _write_struct_request_body(body)
    response_body::String = request_raw(client,
                                        verb,
                                        path;
                                        body = _new_request_body,
                                        headers = headers,
                                        query = query,
                                        status_exception = status_exception)::String
    response_object::T = JSON3.read(response_body,
                                    T;
                                    kwargs...)::T
    return response_object
end

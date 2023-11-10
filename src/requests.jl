@inline function _request_http(verb::AbstractString,
                               full_url::URIs.URI,
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

@inline function _request_http(verb::AbstractString,
                               full_url::URIs.URI,
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

@inline function _request_http(verb::AbstractString,
                               full_url::URIs.URI,
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

@inline function _request_http(verb::AbstractString,
                               full_url::URIs.URI,
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

@inline function _add_trailing_slash(url::HTTP.URI)::HTTP.URI
    _url_string = string(url)
    if endswith(_url_string, "/")
        return url
    end
    return HTTP.URI(string(_url_string, "/"))
end

@inline function _generate_full_url(base::HTTP.URI, path::AbstractString)::HTTP.URI
    # Add trailing slash to base URL
    # This is important since
    # URIs.resolvereference("http://foo/bar", "./baz") = URIs.URI("http://foo/baz")
    # whereas
    # URIs.resolvereference("http://foo/bar/", "./baz") = URIs.URI("http://foo/bar/baz")
    # (compliant with RFC 3986 Section 5.2)
    base_url = _add_trailing_slash(base)

    # Treat all paths without scheme as relative
    # Adding the dot is important since
    # URIs.resolvereference("http://foo/bar/", "/baz") = URIs.URI("http://foo/baz")
    # whereas
    # URIs.resolvereference("http://foo/bar/", "./baz") = URIs.URI("http://foo/bar/baz")
    # (compliant with RFC 3986 Section 5.2)
    _path = replace(path, r"^/+" => "./")

    return URIs.resolvereference(base_url, _path) 
end

"""
    request_raw(client::Client, verb::AbstractString, path::AbstractString; kwargs...)

Perform a request with target `path` and method `verb` (such as `"GET"` or `"POST"`)
for the FHIR `client`, and return a `String` of the body of the response.

# Keyword arguments

- `body::Union{AbstractString, Nothing}` (default: `nothing`): Body of the request.
- `headers::AbstractDict` (default: `Dict{String, String}()`): Headers of the request.
- `query::Union{AbstractDict, Nothing}` (default: `nothing`): Query parameters.
- `require_client_scheme::Bool` (default: `true`): Whether the scheme (`http`/`https`) of the requested URL has to be the scheme of the FHIR `client`.
- `require_client_host::Bool` (default: `true`): Whether the host of the requested URL has to be the host of the FHIR `client`.
- `require_client_path::Bool` (default: `true`): Whether the path of the requested URL has to be a subpath of the path of the FHIR `client`.
"""
@inline function request_raw(client::Client,
                             verb::AbstractString,
                             path::AbstractString;
                             body::Union{AbstractString, Nothing} = nothing,
                             headers::AbstractDict = Dict{String, String}(),
                             query::Union{AbstractDict, Nothing} = nothing,
                             require_client_scheme::Bool = true,
                             require_client_host::Bool = true,
                             require_client_path::Bool = true)::String
    response = _request_raw_response(client,
                                     verb,
                                     path;
                                     body = body,
                                     headers = headers,
                                     query = query,
                                     require_client_scheme = require_client_scheme,
                                     require_client_host = require_client_host,
                                     require_client_path = require_client_path)
    response_body_string::String = String(response.body)::String
    return response_body_string
end

@inline function _request_raw_response(client::Client,
                             verb::AbstractString,
                             path::AbstractString;
                             body::Union{AbstractString, Nothing} = nothing,
                             headers::AbstractDict = Dict{String, String}(),
                             query::Union{AbstractDict, Nothing} = nothing,
                             require_client_scheme::Bool = true,
                             require_client_host::Bool = true,
                             require_client_path::Bool = true)
    # Construct and check the validity of the target URL
    base_url = get_base_url(client).uri
    full_url = _generate_full_url(base_url, path)
    if require_client_scheme && full_url.scheme != base_url.scheme
        throw(ArgumentError("The requested URL ($full_url) must have the same scheme as the FHIR client ($base_url)."))
    end
    if require_client_host && full_url.host != base_url.host
        throw(ArgumentError("The requested URL ($full_url) must have the same host as the FHIR client ($base_url)."))
    end
    if require_client_path && !startswith(full_url.path, base_url.path)
        throw(ArgumentError("The requested URL ($full_url) must be a subpath of the FHIR client ($base_url)."))
    end

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
    request_json(client::Client, verb::AbstractString, path; query, body, headers)
"""
@inline function request_json(client::Client,
                              verb::AbstractString,
                              path::AbstractString;
                              body::Union{JSON3.Object, Nothing} = nothing,
                              headers::AbstractDict = Dict{String, String}(),
                              query::Union{AbstractDict, Nothing} = nothing,
                              require_client_scheme::Bool = true,
                              require_client_host::Bool = true,
                              require_client_path::Bool = true)
    _new_request_body = _write_json_request_body(body)
    response_body::String = request_raw(client,
                                        verb,
                                        path;
                                        body = _new_request_body,
                                        headers = headers,
                                        query = query,
                                        require_client_scheme = require_client_scheme,
                                        require_client_host = require_client_host,
                                        require_client_path = require_client_path)::String
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
                         require_client_scheme::Bool = true,
                         require_client_host::Bool = true,
                         require_client_path::Bool = true,
                         kwargs...)::T where T
    _new_request_body = _write_struct_request_body(body)
    response_body::String = request_raw(client,
                                        verb,
                                        path;
                                        body = _new_request_body,
                                        headers = headers,
                                        query = query,
                                        require_client_scheme = require_client_scheme,
                                        require_client_host = require_client_host,
                                        require_client_path = require_client_path)::String
    response_object::T = JSON3.read(response_body,
                                    T;
                                    kwargs...)::T
    return response_object
end

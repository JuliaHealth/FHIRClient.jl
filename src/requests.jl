@inline function _request_http(
    verb::AbstractString,
    full_url::URIs.URI,
    headers::AbstractDict,
    query::Nothing,
    body::Nothing,
)
    response = HTTP.request(verb, full_url, headers)
    return response
end

@inline function _request_http(
    verb::AbstractString,
    full_url::URIs.URI,
    headers::AbstractDict,
    query::Nothing,
    body::AbstractString,
)
    response = HTTP.request(verb, full_url, headers, body)
    return response
end

@inline function _request_http(
    verb::AbstractString,
    full_url::URIs.URI,
    headers::AbstractDict,
    query::AbstractDict,
    body::Nothing,
)
    response = HTTP.request(verb, full_url, headers; query = query)
    return response
end

@inline function _request_http(
    verb::AbstractString,
    full_url::URIs.URI,
    headers::AbstractDict,
    query::AbstractDict,
    body::AbstractString,
)
    response = HTTP.request(verb, full_url, headers, body; query = query)
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
    _path = startswith(path, "/") ? "." * path : path

    return URIs.resolvereference(base_url, _path)
end

const _common_docstring_request = """
- `headers::AbstractDict = Dict{String, String}()`: headers of the request.
- `query::Union{AbstractDict, Nothing} = nothing`: query parameters.
- `require_base_url::Symbol = :strict`: to what extent the requested URL has to match the base URL of the `client`. Possible values are:
    - `:strict` (requested URL has to start with the base URL),
    - `:host` (host and scheme of the requested URL and base URL have to be equal),
    - `:scheme` (scheme of the requested URL and base URL have to be equal),
    - `:no` (requested URL does not have to match the base URL).
"""

"""
    request_raw(
        client::Client, verb::AbstractString, path::AbstractString;
        <keyword arguments>
    )

Perform a request with target `path` and method `verb` (such as `"GET"` or `"POST"`)
for the FHIR `client`, and return the body of the response as `String`.

# Arguments

- `body::Union{AbstractString, Nothing} = nothing`: body of the request.
$(_common_docstring_request)

See also [`request_json`](@ref) and [`request`](@ref).
"""
@inline function request_raw(
    client::Client,
    verb::AbstractString,
    path::AbstractString;
    body::Union{AbstractString,Nothing} = nothing,
    headers::AbstractDict = Dict{String,String}(),
    query::Union{AbstractDict,Nothing} = nothing,
    require_base_url::Symbol = :strict,
)::String
    response = _request_raw_response(
        client,
        verb,
        path;
        body = body,
        headers = headers,
        query = query,
        require_base_url = require_base_url,
    )
    response_body_string::String = String(response.body)::String
    return response_body_string
end

@inline function _request_raw_response(
    client::Client,
    verb::AbstractString,
    path::AbstractString;
    body::Union{AbstractString,Nothing} = nothing,
    headers::AbstractDict = Dict{String,String}(),
    query::Union{AbstractDict,Nothing} = nothing,
    require_base_url::Symbol = :strict,
)
    # Check that `require_base_url` is valid
    if require_base_url !== :strict &&
       require_base_url !== :host &&
       require_base_url !== :scheme &&
       require_base_url !== :no
        throw(
            ArgumentError(
                "The provided keyword argument `require_base_url = $(require_base_url)` is invalid: `require_base_url` must be `:strict`, `:host`, `:scheme`, or `:no`.",
            ),
        )
    end

    # Construct and check the validity of the target URL
    base_url = get_base_url(client).uri
    full_url = _generate_full_url(base_url, path)
    if require_base_url !== :no
        if lowercase(full_url.scheme) != lowercase(base_url.scheme)
            throw(
                ArgumentError(
                    "The scheme of the requested URL ($full_url) and the base URL ($base_url) are not equal: If the requested URL is correct, set `require_base_url = :no`.",
                ),
            )
        end

        if require_base_url !== :scheme
            if lowercase(full_url.host) !== lowercase(base_url.host)
                throw(
                    ArgumentError(
                        "The host of the requested URL ($full_url) and the base URL ($base_url) are not equal: If the requested URL is correct, set `require_base_url = :scheme`.",
                    ),
                )
            end

            if require_base_url !== :host && !startswith(full_url.path, base_url.path)
                throw(
                    ArgumentError(
                        "The requested URL ($full_url) does not start with the base URL ($base_url): If the requested URL is correct, set `require_base_url = :host`.",
                    ),
                )
            end
        end
    end

    _new_headers = Dict{String,String}()
    json_headers!(_new_headers)
    authentication_headers!(_new_headers, client)
    merge!(_new_headers, headers)
    response = _request_http(verb, full_url, _new_headers, query, body)
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
    request_json(
        client::Client, verb::AbstractString, path::AbstractString;
        <keyword arguments>
    )

Perform a request with target `path` and method `verb` (such as `"GET"` or `"POST"`)
for the FHIR `client`, and parse the JSON response with JSON3.

# Arguments

- `body::Union{JSON3.Object, Nothing} = nothing`: JSON body of the request.
$(_common_docstring_request)

See also [`request`](@ref) and [`request_raw`](@ref).
"""
@inline function request_json(
    client::Client,
    verb::AbstractString,
    path::AbstractString;
    body::Union{JSON3.Object,Nothing} = nothing,
    headers::AbstractDict = Dict{String,String}(),
    query::Union{AbstractDict,Nothing} = nothing,
    require_base_url::Symbol = :strict,
)
    _new_request_body = _write_json_request_body(body)
    response_body::String = request_raw(
        client,
        verb,
        path;
        body = _new_request_body,
        headers = headers,
        query = query,
        require_base_url = require_base_url,
    )::String
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
    request(
        T, client::Client, verb::AbstractString, path::AbstractString;
        <keyword arguments>
    )

Perform a request with target `path` and method `verb` (such as `"GET"` or `"POST"`)
for the FHIR `client`, and parse the JSON response with JSON3 as an object of type `T`.

# Arguments

- `body = nothing`: JSON body of the request.
$(_common_docstring_request)
- `kwargs...`: remaining keyword arguments that are forwarded to `JSON3.read` for parsing the JSON response.

See also [`request_json`](@ref) and [`request_raw`](@ref).
"""
@inline function request(
    ::Type{T},
    client::Client,
    verb::AbstractString,
    path::AbstractString;
    body = nothing,
    headers::AbstractDict = Dict{String,String}(),
    query::Union{AbstractDict,Nothing} = nothing,
    require_base_url::Symbol = :strict,
    kwargs...,
) where {T}
    _new_request_body = _write_struct_request_body(body)
    response_body = request_raw(
        client,
        verb,
        path;
        body = _new_request_body,
        headers = headers,
        query = query,
        require_base_url = require_base_url,
    )::String

    # Recall that the default log levels are:
    #     Error === LogLevel(2_000)
    #     Warn === LogLevel(1_000)
    #     Info === LogLevel(0)
    #     Debug === LogLevel(-1_000)
    #
    # Ref: https://docs.julialang.org/en/v1/stdlib/Logging

    @logmsg LogLevel(-1_000) "FHIRClient.request()" path verb tryparse_json(response_body)

    response_object = JSON3.read(response_body, T; kwargs...)::T
    return response_object
end

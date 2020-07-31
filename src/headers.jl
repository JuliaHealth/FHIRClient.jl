import Base64

function json_headers!(headers::AbstractDict)
    headers["Accept"] = "application/json"
    headers["Content-Type"] = "application/json"
    return headers
end

function authentication_headers!(headers::AbstractDict, client::Client)
    auth = get_auth(client)
    return authentication_headers!(headers, auth)
end

function authentication_headers!(headers::AbstractDict, auth::AnonymousAuth)
    return headers
end

function authentication_headers!(headers::AbstractDict, auth::OAuth2)
    headers["Authorization"] = "Bearer $(auth.oauth2_token)"
    return headers
end

function authentication_headers!(headers::AbstractDict, auth::JWTAuth)
    headers["Authorization"] = "Bearer $(auth.jwt_token)"
    return headers
end


function authentication_headers!(headers::AbstractDict, auth::UsernamePassAuth)
    headers["Authorization"] = "Basic $(Base64.base64encode(string(auth.username, ':', auth.password)))"
    return headers
end

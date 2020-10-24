function set_credential!(cred::Credential,
                         value::AbstractString)::Nothing
    Base.shred!(cred.secret_buffer)
    seekstart(cred.secret_buffer)
    write(cred.secret_buffer, value)
    return nothing
end

function get_credential(cred::Credential)::String
    seekstart(cred.secret_buffer)
    return read(cred.secret_buffer, String)
end

function Base.shred!(cred::Credential)::Nothing
    Base.shred!(cred.secret_buffer)
    return nothing
end

function set_token!(jwt_auth::JWTAuth,
                    token_value::AbstractString)::Nothing
    set_credential!(jwt_auth.jwt_cred, token_value)
    return nothing
end

function set_token!(oauth2::OAuth2,
                    token_value::AbstractString)::Nothing
    set_credential!(oauth2.oauth2_cred, token_value)
    return nothing
end

function set_password!(password_auth::UsernamePassAuth,
                       password_value::AbstractString)::Nothing
    set_credential!(password_auth.password_cred, password_value)
    return nothing
end

function get_token(jwt_auth::JWTAuth)::String
    return get_credential(jwt_auth.jwt_cred)
end

function get_token(oauth2::OAuth2)::String
    return get_credential(oauth2.oauth2_cred)
end

function get_username(password_auth::UsernamePassAuth)::String
    return password_auth.username
end

function get_password(password_auth::UsernamePassAuth)::String
    return get_credential(password_auth.password_cred)
end

function Base.shred!(anonymous_auth::AnonymousAuth)::Nothing
    return nothing
end

function Base.shred!(jwt_auth::JWTAuth)::Nothing
    Base.shred!(jwt_auth.jwt_cred)
    return nothing
end

function Base.shred!(oauth2::OAuth2)::Nothing
    Base.shred!(oauth2.oauth2_cred)
    return nothing
end

function Base.shred!(password_auth::UsernamePassAuth)::Nothing
    Base.shred!(password_auth.password_cred)
    return nothing
end

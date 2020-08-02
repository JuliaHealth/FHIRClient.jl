```@meta
CurrentModule = FHIRClient
```

# Authentication

```julia
julia> auth = FHIRClient.AnonymousAuth()
FHIRClient.AnonymousAuth()
```

```julia
julia> auth = FHIRClient.OAuth2()
FHIRClient.OAuth2(FHIRClient.Credential(SecretBuffer("*******")))

julia> FHIRClient.set_token!(auth, "token_value")
```

```julia
julia> auth = FHIRClient.UsernamePassAuth(; username = "my_username")
FHIRClient.UsernamePassAuth("my_username", FHIRClient.Credential(SecretBuffer("*******")))

julia> FHIRClient.set_password!(auth, "my_password")
```

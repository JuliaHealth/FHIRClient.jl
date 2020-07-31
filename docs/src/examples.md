```@meta
CurrentModule = FHIRClient
```

# Examples

```jldoctest
julia> using FHIRClient

julia> endpoint = FHIRClient.Endpoint("https://hapi.fhir.org/baseR4")

julia> fhir_version = FHIRClient.R4()

julia> auth = FHIRClient.AnonymousAuth()

julia> client = FHIRClient.Client(fhir_version, endpoint, auth)

julia> response = FHIRClient.fhir_get_json(client, "/Patient/22692")
```

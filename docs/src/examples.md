```@meta
CurrentModule = FHIRClient
```

# Examples

## Basic example

```@repl
using FHIRClient
using FHIRClient.R4Types
fhir_version = FHIRClient.R4()
base_url = FHIRClient.BaseURL("https://hapi.fhir.org/baseR4")
auth = FHIRClient.AnonymousAuth()
client = FHIRClient.Client(fhir_version, base_url, auth)
request_path = "/Patient/1476056"
p = FHIRClient.request(Patient, client, "GET", request_path)
typeof(p)
fieldnames(Patient)
p.name
```

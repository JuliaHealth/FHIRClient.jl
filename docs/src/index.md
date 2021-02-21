```@meta
CurrentModule = FHIRClient
```

# FHIRClient

[FHIRClient](https://github.com/JuliaHealth/FHIRClient.jl)
provides a Julia client for connecting to servers that support the
[Fast Healthcare Interoperability Resources (FHIR)](https://hl7.org/fhir/)
specification and building
[SMART on FHIR](https://docs.smarthealthit.org/)
applications.

The source code for this package is available in the [GitHub repository](https://github.com/JuliaHealth/FHIRClient.jl).

The following tables show the mapping between Julia packages and
standards/specifications:

| Julia Package | Standard/Specification | Description |
| ------------- | ---------------------- | ----------- |
| [FHIRClient.jl](https://github.com/JuliaHealth/FHIRClient.jl) | [FHIR](https://hl7.org/fhir/) | Fast Healthcare Interoperability Resources. Web standard for health interop. |
| [SMARTAppLaunch.jl](https://github.com/JuliaHealth/SMARTAppLaunch.jl) | [SMART App Launch](https://hl7.org/fhir/smart-app-launch/) | User-facing apps that connect to EHRs and health portals. |
| [SMARTBackendServices.jl](https://github.com/JuliaHealth/SMARTBackendServices.jl) | [SMART Backend Services](https://hl7.org/fhir/uv/bulkdata/authorization/) | Server-to-server FHIR connections. |

---

We currently do not implement the following; however, we plan to implement them
in the future:

| Standard/Specification | Description |
| ---------------------- | ----------- |
| [FHIR Bulk Data Access (Flat FHIR)](https://hl7.org/fhir/uv/bulkdata/) | FHIR export API for large-scale data access. |

These descriptions are taken from the
[SMART on FHIR technical documentation](https://docs.smarthealthit.org/).

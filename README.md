# FHIRClient

[![Stable][docs-stable-img]][docs-stable-url]
[![Dev][docs-dev-img]][docs-dev-url]
[![Build Status][ci-img]][ci-url]
[![PkgEval][pkgeval-img]][pkgeval-url]
[![Coverage][codecov-img]][codecov-url]

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://JuliaHealth.github.io/FHIRClient.jl/stable
[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://JuliaHealth.github.io/FHIRClient.jl/dev
[ci-img]: https://github.com/JuliaHealth/FHIRClient.jl/workflows/CI/badge.svg
[ci-url]: https://github.com/JuliaHealth/FHIRClient.jl/actions
[pkgeval-img]: https://juliaci.github.io/NanosoldierReports/pkgeval_badges/F/FHIRClient.named.svg
[pkgeval-url]: https://juliaci.github.io/NanosoldierReports/pkgeval_badges/F/FHIRClient.html
[codecov-img]: https://codecov.io/gh/JuliaHealth/FHIRClient.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/JuliaHealth/FHIRClient.jl

FHIRClient
provides a Julia client for connecting to servers that support the
[Fast Healthcare Interoperability Resources (FHIR)](https://hl7.org/fhir/)
specification and building
[SMART on FHIR](https://docs.smarthealthit.org/)
applications.

Please see the [documentation](https://juliahealth.org/FHIRClient.jl/stable/).

The following tables show the mapping between Julia packages and
standards/specifications:

| Julia Package | Standard/Specification | Description |
| ------------- | ---------------------- | ----------- |
| [FHIRClient.jl](https://github.com/JuliaHealth/FHIRClient.jl) | [FHIR](https://hl7.org/fhir/) | Fast Healthcare Interoperability Resources. Web standard for health interop. |
| [SMARTAppLaunch.jl](https://github.com/JuliaHealth/SMARTAppLaunch.jl) | [SMART App Launch](https://hl7.org/fhir/smart-app-launch/) | User-facing apps that connect to EHRs and health portals. |

---

We currently do not implement the following; however, we plan to implement them
in the future:

| Standard/Specification | Description |
| ---------------------- | ----------- |
| [CDS Hooks](https://cds-hooks.hl7.org/) | Clinical Decision Support Hooks. Web standard for CDS in the EHR workflow. |
| [FHIR Bulk Data Access (Flat FHIR)](https://hl7.org/fhir/uv/bulkdata/) | FHIR export API for large-scale data access. |
| [SMART Backend Services](https://hl7.org/fhir/uv/bulkdata/authorization/) | Server-to-server FHIR connections. |

These descriptions are taken from the
[SMART on FHIR technical documentation](https://docs.smarthealthit.org/).

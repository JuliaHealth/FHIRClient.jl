# FHIRClient

[![Stable][docs-stable-img]][docs-stable-url]
[![Dev][docs-dev-img]][docs-dev-url]
[![Build Status][ci-img]][ci-url]
[![PkgEval][pkgeval-img]][pkgeval-url]
[![Coverage][codecov-img]][codecov-url]
[![Coveralls][coveralls-img]][coveralls-url]

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
[coveralls-img]: https://coveralls.io/repos/github/JuliaHealth/FHIRClient.jl/badge.svg
[coveralls-url]: https://coveralls.io/github/JuliaHealth/FHIRClient.jl

FHIRClient
provides a Julia client for connecting to servers that support the
[Fast Healthcare Interoperability Resources (FHIR)](https://hl7.org/fhir/)
specification and building
[SMART on FHIR](https://docs.smarthealthit.org/)
applications.

Please see the [documentation](https://JuliaHealth.github.io/FHIRClient.jl/stable).

---

FHIRClient implements the following functionality:
1. [FHIR](https://hl7.org/fhir/): Fast Healthcare Interoperability Resources. Web standard for health interop.

We currently do not implement the following; however, we would like to do so
in the future:
1. [CDS Hooks](https://cds-hooks.hl7.org/): Clinical Decision Support Hooks. Web standard for CDS in the EHR workflow.
2. [US Core Data Profiles](https://www.hl7.org/fhir/us/core/): FHIR data profiles for health data in the US (“core data for interoperability”).
3. [FHIR Bulk Data API Implementation Guide](https://hl7.org/fhir/uv/bulkdata/): FHIR export API for large-scale data access.
4. [SMART App Launch](https://hl7.org/fhir/smart-app-launch/): User-facing apps that connect to EHRs and health portals.
5. [SMART Backend Services](https://hl7.org/fhir/uv/bulkdata/authorization/): Server-to-server FHIR connections.

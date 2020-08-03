```@meta
CurrentModule = FHIRClient
```

# FHIR Versions

The following table shows which versions of the FHIR specification are
implemented in each version of the `FHIRClient.jl` Julia package.

| `FHIRClient.jl` | FHIR releases | FHIR versions |
| --------------- | ------------- | ------------- |
| 0.1.0           |  R4           | 4.0.1 (R4)    |

In order to see the full FHIR version number
for a specific FHIR release, use the
`FHIRClient.fhir_version` function:
```julia
julia> FHIRClient.fhir_version(FHIRClient.R4()) # prints the full FHIR version number for the R4 release
```

In order to see the current `FHIRClient.jl` version, use the
`FHIRClient.version` function:
```julia
julia> FHIRClient.version() # prints the current `FHIRClient.jl` version number
```

To see all versions of the FHIR specification, go to the
[directory of published FHIR versions](http://hl7.org/fhir/directory.html).

To see all versions of `FHIRClient.jl`, go to the
[`FHIRClient.jl` release page](https://github.com/JuliaHealth/FHIRClient.jl/releases).

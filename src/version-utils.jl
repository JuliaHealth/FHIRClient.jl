import Pkg

"""
The version of the FHIRClient.jl package.
"""
function version()::VersionNumber
    package_directory = dirname(dirname(@__FILE__))
    project_file = joinpath(package_directory, "Project.toml")
    version_string = Pkg.TOML.parsefile(project_file)["version"]
    version_number = VersionNumber(version_string)
    return version_number
end

"""
The version of the Fast Healthcare Interoperability Resources (FHIR)
specification being implemented.
"""
function fhir_version end

@inline function fhir_version(::R4)::VersionNumber
    return FHIR_VERSION_R4
end

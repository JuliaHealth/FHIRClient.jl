import Pkg

"""
The version of the FHIRClients.jl package.
"""
function version()::VersionNumber
    package_directory = dirname(dirname(@__FILE__))
    project_file = joinpath(package_directory, "Project.toml")
    version_string = Pkg.TOML.parsefile(project_file)["version"]
    version_number = VersionNumber(version_string)
    return version_number
end

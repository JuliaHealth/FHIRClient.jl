import FHIRClient
import Generate
import Documenter

Documenter.makedocs(;
    modules=[FHIRClient, Generate],
    authors="Dilum Aluthge, Rhode Island Quality Institute, and contributors",
    repo="https://github.com/JuliaHealth/FHIRClient.jl/blob/{commit}{path}#L{line}",
    sitename="FHIRClient.jl",
    format=Documenter.Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaHealth.github.io/FHIRClient.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Installing FHIRClient" => "installation.md",
        "Examples" => "examples.md",
        "API" => "api.md",
        "Auto-generating the type definitions" => "generate.md",
    ],
    strict=true,
)

Documenter.deploydocs(;
    repo="github.com/JuliaHealth/FHIRClient.jl",
)

using FHIRClient
using Documenter

makedocs(;
    modules=[FHIRClient],
    authors="Dilum Aluthge, Brown Center for Biomedical Informatics, JuliaHealth, and contributors",
    repo="https://github.com/JuliaHealth/FHIRClient.jl/blob/{commit}{path}#L{line}",
    sitename="FHIRClient.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaHealth.github.io/FHIRClient.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Examples" => "examples.md",
        "Version" => "versions.md",
        "API" => "api.md",
    ],
    strict = true,
)

deploydocs(;
    repo="github.com/JuliaHealth/FHIRClient.jl",
)

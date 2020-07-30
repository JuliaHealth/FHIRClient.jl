using FHIRClients
using Documenter

makedocs(;
    modules=[FHIRClients],
    authors="Dilum Aluthge, Brown Center for Biomedical Informatics, JuliaHealth, and contributors",
    repo="https://github.com/JuliaHealth/FHIRClients.jl/blob/{commit}{path}#L{line}",
    sitename="FHIRClients.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaHealth.github.io/FHIRClients.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Examples" => "examples.md",
        "API" => "index.md",
    ],
    strict = true,
)

deploydocs(;
    repo="github.com/JuliaHealth/FHIRClients.jl",
)

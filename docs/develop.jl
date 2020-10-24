using Pkg

Pkg.activate(@__DIR__)

devpkgs = [
    PackageSpec(path = dirname(@__DIR__)),
    PackageSpec(path = joinpath(dirname(@__DIR__), "Generate")),
]

Pkg.develop(devpkgs)

Pkg.add(PackageSpec(url = "https://github.com/DilumAluthge/JSON3.jl", rev = "dpa/abstracttype-with-single-subtype"))

Pkg.instantiate()

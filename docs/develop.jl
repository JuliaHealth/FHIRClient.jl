using Pkg

Pkg.activate(@__DIR__)

devpkgs = [
    PackageSpec(path = dirname(@__DIR__)),
    PackageSpec(path = joinpath(dirname(@__DIR__), "Generate")),
]

Pkg.develop(devpkgs)

Pkg.instantiate()

Pkg.precompile()

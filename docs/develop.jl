import Pkg

Pkg.activate(@__DIR__)

devpkgs = [
    Pkg.PackageSpec(path = dirname(@__DIR__)),
    Pkg.PackageSpec(path = joinpath(dirname(@__DIR__), "Generate")),
]

Pkg.develop(devpkgs)

Pkg.instantiate()

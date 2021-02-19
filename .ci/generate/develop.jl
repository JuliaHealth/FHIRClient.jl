import Pkg

Pkg.activate(@__DIR__)

devpkgs = [
    PackageSpec(path = joinpath(dirname(dirname(@__DIR__)), "Generate")),
]

Pkg.develop(devpkgs)

Pkg.instantiate()

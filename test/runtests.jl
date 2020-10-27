using FHIRClient
using Test

import Documenter
import Pkg

const JSON3 = FHIRClient.JSON3

Pkg.develop(Pkg.PackageSpec(path = joinpath(dirname(@__DIR__), "Generate")))
import Generate

@testset "FHIRClient.jl" begin
    include("test-generate.jl")
    include("unit-tests.jl")
    include("integration-tests.jl")
    include("run-doctests.jl")
end

using FHIRClient
using Test

import Documenter
import Pkg

Pkg.develop(Pkg.PackageSpec(path = joinpath(dirname(@__DIR__), "Generate")))
import Generate

@testset "FHIRClient.jl" begin
    include("unit-tests.jl")
    include("integration-tests.jl")
    include("run-doctests.jl")
    include("test-generate.jl")
end

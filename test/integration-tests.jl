using FHIRClient
using Test

@testset "Integration tests" begin
    include("integration-tests/json.jl")
    include("integration-tests/basic-read.jl")
end

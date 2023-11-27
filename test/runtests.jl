using FHIRClient
using Test

import Dates
import JSON3
import URIs

include("test_server.jl")

const test_server = TestFHIRServer()

@testset "FHIRClient.jl" begin
    include("unit.jl")
    include("integration.jl")
end

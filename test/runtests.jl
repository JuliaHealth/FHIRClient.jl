using FHIRClient
using Test

import Dates
import JSON3
import URIs

@testset "FHIRClient.jl" begin
    include("unit.jl")
    include("integration.jl")
end

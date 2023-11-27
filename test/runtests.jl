using FHIRClient
using Test

import Dates
import HTTP
import JSON3
import Suppressor
import URIs

@testset "FHIRClient.jl" begin
    include("unit.jl")
    include("integration.jl")
end

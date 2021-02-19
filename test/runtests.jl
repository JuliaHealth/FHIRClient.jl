using FHIRClient
using Test

import Dates
import HTTP
import JSON3
import Test

@testset "FHIRClient.jl" begin
    include("unit.jl")
    include("integration.jl")
end

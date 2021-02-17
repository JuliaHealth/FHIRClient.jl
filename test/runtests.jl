using FHIRClient
using Test

import Dates
import HTTP
# import JSON3
import Test

const JSON3 = FHIRClient.JSON3

import Dates
import .JSON3

@testset "FHIRClient.jl" begin
    include("unit.jl")
    include("integration.jl")
end

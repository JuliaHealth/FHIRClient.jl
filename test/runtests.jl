using FHIRClient
using Test

import Dates
import HTTP
# import JSON3
import Test

const JSON3 = FHIRClient.JSON3

@testset "FHIRClient.jl" begin
    include("unit-tests.jl")
    include("integration-tests.jl")
end

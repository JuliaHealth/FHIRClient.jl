using FHIRClient
using Test

import Dates
import HTTP
import JSON3
import Logging
import Suppressor
import URIs

# This is necessary to work around https://github.com/JuliaLang/julia/issues/52234
# Also possibly related: https://github.com/JuliaLang/julia/issues/34037
#
# Note: this is a GLOBAL setting:
# Logging.disable_logging(Logging.BelowMinLevel)

@testset "FHIRClient.jl" begin
    # When we run the tests, we want to make sure that none of the `@logmsg`
    # statements throw any errors.
    test_logger = Test.TestLogger(;
        # min_level = Logging.BelowMinLevel,
        min_level = Logging.LogLevel(-5_000),
        catch_exceptions = false,
    )
    Logging.with_logger(test_logger) do
        include("unit.jl")
        include("integration.jl")
    end
end

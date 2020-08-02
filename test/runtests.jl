using FHIRClient

using Documenter
using Test

FHIRCLIENT_AUTHENTICATED_TESTS = get(ENV, "FHIRCLIENT_AUTHENTICATED_TESTS", "") == "true"
@info("FHIRCLIENT_AUTHENTICATED_TESTS: $(FHIRCLIENT_AUTHENTICATED_TESTS)")

@testset "FHIRClient.jl" begin
    @testset "Unit tests" begin
        include("unit-tests.jl")
    end
    @testset "Doctests" begin
        doctest(FHIRClient)
    end
    @testset "Integration tests" begin
        @testset "Integration tests: unauthenticated" begin
            include("integration-tests/unauthenticated-integration-tests/basic-test.jl")
        end
        if FHIRCLIENT_AUTHENTICATED_TESTS
            @info("FHIRCLIENT_AUTHENTICATED_TESTS is true. Running the authenticated tests now...")
            @testset "Integration tests: authenticated" begin
            end
        else
            @info("FHIRCLIENT_AUTHENTICATED_TESTS is not true, so we will not run the authenticated tests.")
        end
    end
end

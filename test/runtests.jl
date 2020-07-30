using FHIRClients

using Documenter
using Test

FHIRCLIENTS_AUTHENTICATED_TESTS = get(ENV, "FHIRCLIENTS_AUTHENTICATED_TESTS", "") == "true"
@info("FHIRCLIENTS_AUTHENTICATED_TESTS: $(FHIRCLIENTS_AUTHENTICATED_TESTS)")

@testset "FHIRClient.jl" begin
    @testset "Unit tests" begin
        include("unit-tests.jl")
    end
    @testset "Doctests" begin
        doctest(FHIRClients)
    end
    @testset "Integration tests" begin
        @testset "Integration tests: unauthenticated" begin
            include("integration-tests/unauthenticated-integration-tests/basic-test.jl")
        end
        if FHIRCLIENTS_AUTHENTICATED_TESTS
            @info("FHIRCLIENTS_AUTHENTICATED_TESTS is true. Running the authenticated tests now...")
        else
            @info("FHIRCLIENTS_AUTHENTICATED_TESTS is not true, so we will not run the authenticated tests.")
        end
    end
end

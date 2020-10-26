using FHIRClient
using Test

import HTTP

@testset "Unit tests" begin
    @testset "fhir-to-julia.jl" begin
        @test FHIRClient.fhir_to_julia(:end) == :end_fhir
        @test FHIRClient.julia_to_fhir(:end_fhir) == :end
        @test FHIRClient.fhir_to_julia(:birthDate) == :birthDate
        @test FHIRClient.julia_to_fhir(:birthDate) == :birthDate
    end
    
    @testset "requests.jl" begin
        @test FHIRClient._add_trailing_slash(HTTP.URI("https://example.com")) == HTTP.URI("https://example.com/")
        @test FHIRClient._add_trailing_slash(HTTP.URI("https://example.com/")) == HTTP.URI("https://example.com/")
    end
end
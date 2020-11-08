using FHIRClient
using Test

import HTTP

@testset "Unit tests" begin
    @testset "fhir-to-julia.jl" begin
        @testset "fhir_to_julia" begin
            @test FHIRClient.fhir_to_julia(:end) == :end_fhir
            @test FHIRClient.fhir_to_julia(:function) == :function_fhir
            @test FHIRClient.fhir_to_julia(:global) == :global_fhir
            @test FHIRClient.fhir_to_julia(:import) == :import_fhir
            @test FHIRClient.fhir_to_julia(:for) == :for_fhir
            @test FHIRClient.fhir_to_julia(:birthDate) == :birthDate
        end

        @testset "julia_to_fhir" begin
            @test FHIRClient.julia_to_fhir(:end_fhir) == :end
            @test FHIRClient.julia_to_fhir(:function_fhir) == :function
            @test FHIRClient.julia_to_fhir(:global_fhir) == :global
            @test FHIRClient.julia_to_fhir(:import_fhir) == :import
            @test FHIRClient.julia_to_fhir(:for_fhir) == :for
            @test FHIRClient.julia_to_fhir(:birthDate) == :birthDate
        end
    end

    @testset "requests.jl" begin
        @test FHIRClient._add_trailing_slash(HTTP.URI("https://example.com")) == HTTP.URI("https://example.com/")
        @test FHIRClient._add_trailing_slash(HTTP.URI("https://example.com/")) == HTTP.URI("https://example.com/")
    end

    @testset "Auto-generated source files" begin
        @testset "R4" begin
            @testset "Patient" begin
                p = FHIRClient.R4Types.Patient()
                @test p.resourceType isa String
                @test p.resourceType == "Patient"
            end
        end
    end
end

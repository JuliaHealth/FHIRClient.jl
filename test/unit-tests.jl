using FHIRClient
using Test

import Generate

@testset "Unit tests" begin
    @testset "fhirname-to-julianame.jl" begin
        @testset "has_julia_name" begin
            @test FHIRClient.has_julia_name("string")
            @test !FHIRClient.has_julia_name("THIS_DOES_NOT_EXIST")
        end
        @testset "has_fhir_name" begin
            @test FHIRClient.has_fhir_name("string_fhir")
            @test !FHIRClient.has_fhir_name("THIS_DOES_NOT_EXIST")
        end
        @testset "fhir_to_julia" begin
            @test FHIRClient.fhir_to_julia("string") == "string_fhir"
            @test FHIRClient.fhir_to_julia("boolean") == "Bool"
            @test_throws KeyError FHIRClient.fhir_to_julia("THIS_DOES_NOT_EXIST")
        end
        @testset "julia_to_fhir" begin
            @test FHIRClient.julia_to_fhir("string_fhir") == "string"
            @test_throws KeyError FHIRClient.julia_to_fhir("THIS_DOES_NOT_EXIST")
        end
        @testset "fhir_to_julia_maybe" begin
            @test FHIRClient.fhir_to_julia_maybe("string") == "string_fhir"
            @test FHIRClient.fhir_to_julia_maybe("boolean") == "Bool"
            @test FHIRClient.fhir_to_julia_maybe("THIS_DOES_NOT_EXIST") == "THIS_DOES_NOT_EXIST"
        end
        @testset "julia_to_fhir_maybe" begin
            @test FHIRClient.julia_to_fhir_maybe("string_fhir") == "string"
            @test FHIRClient.julia_to_fhir_maybe("THIS_DOES_NOT_EXIST") == "THIS_DOES_NOT_EXIST"
        end
    end
end

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

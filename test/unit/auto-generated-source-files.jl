@testset "Auto-generated source files" begin
    @testset "R4" begin
        @testset "Patient" begin
            p = FHIRClient.R4Types.Patient()
            @test p.resourceType isa String
            @test p.resourceType == "Patient"
        end
    end
end

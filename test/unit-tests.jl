using FHIRClient

using Test

@testset "version" begin
    @test FHIRClient.version() isa VersionNumber
    @test FHIRClient.version() > v"0"

    @test FHIRClient.fhir_version(FHIRClient.R4()) isa VersionNumber
    @test FHIRClient.fhir_version(FHIRClient.R4()) > v"0"
    @test FHIRClient.fhir_version(FHIRClient.R4()) == FHIRClient.FHIR_VERSION_R4
end

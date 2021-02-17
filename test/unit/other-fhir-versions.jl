@testset "other-fhir-versions.jl" begin
    @test FHIRClient.DSTU2() isa FHIRClient.DSTU2
    @test FHIRClient.STU3() isa FHIRClient.STU3
    @test FHIRClient.UnknownFHIRVersion() isa FHIRClient.UnknownFHIRVersion
    @test FHIRClient.OtherFHIRVersion{:DSTU2}() isa FHIRClient.OtherFHIRVersion
    @test FHIRClient.OtherFHIRVersion{:DSTU2}() isa FHIRClient.OtherFHIRVersion{:DSTU2}
end

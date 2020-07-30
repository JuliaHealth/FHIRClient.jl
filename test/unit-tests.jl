using FHIRClients

using Test

@testset "version" begin
    @test FHIRClients.version() isa VersionNumber
    @test FHIRClients.version() > v"0"
end

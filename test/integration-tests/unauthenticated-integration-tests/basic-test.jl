using FHIRClient

using Test

@testset "Basic test" begin
    endpoint = FHIRClient.Endpoint("https://hapi.fhir.org/baseR4")
    fhir_version = FHIRClient.R4()
    client = FHIRClient.Client(fhir_version, endpoint)
    query = "/Patient/22692"
    response = FHIRClient.fhir_get_json(client, query)
    @test response.resourceType == "Patient"
    @test response.id == "22692"
    @test length(response.name) == 1
    @test response.name[1].text == "Jason Argonaut"
    @test response.name[1].family == "Argonaut"
    @test response.name[1].given == String["Jason"]
end

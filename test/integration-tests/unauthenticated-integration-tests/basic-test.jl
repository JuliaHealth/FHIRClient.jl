using FHIRClients

using Test

@testset "Basic test" begin
    endpoint = FHIRClients.Endpoint("https://open-ic.epic.com/FHIR/api/FHIR/DSTU2/")
    client = FHIRClients.Client(endpoint)
    patient_search_string = "/Patient?given=Jason&family=Argonaut"
    response = FHIRClients.fhir_get_json(client, patient_search_string)
    @test response.entry[1].resource.name[1].text == "Jason Argonaut"
    @test response.entry[1].resource.name[1].family == ["Argonaut"]
    @test response.entry[1].resource.name[1].given == ["Jason"]
end

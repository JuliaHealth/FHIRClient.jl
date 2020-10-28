using FHIRClient
using Test

import Dates
import .JSON3

@testset "Raw JSON" begin
    fhir_version = FHIRClient.R4()
    base_url = FHIRClient.BaseURL("https://hapi.fhir.org/baseR4")
    auth = FHIRClient.AnonymousAuth()
    client = FHIRClient.Client(fhir_version, base_url, auth)
    search_request = "/Patient?given=Jason&family=Argonaut"
    json_response_search_results_bundle = FHIRClient._request_json(client, "GET", search_request)
    patient_id = json_response_search_results_bundle.entry[1].resource.id
    patient_request = "/Patient/$(patient_id)"
    json_responses_patient = [
        FHIRClient._request_json(client, "GET", patient_request),
        FHIRClient._request_json(client, "GET", patient_request; body = JSON3.read("{}")),
        FHIRClient._request_json(client, "GET", patient_request; query = Dict{String, String}()),
        FHIRClient._request_json(client, "GET", patient_request; body = JSON3.read("{}"), query = Dict{String, String}()),
    ]
    for json_response_patient in json_responses_patient
        @test json_response_patient isa JSON3.Object
    end
    Base.shred!(auth)
    Base.shred!(client)
end

using FHIRClient
using Test

import Dates
import .JSON3

@testset "Basic reading" begin
    anonymous_auth = FHIRClient.AnonymousAuth()
    oauth2_auth = FHIRClient.OAuth2()
    FHIRClient.set_token!(oauth2_auth, "helloworld")
    jwt_auth = FHIRClient.JWTAuth()
    FHIRClient.set_token!(jwt_auth, "helloworld")
    username_password_auth_1 = FHIRClient.UsernamePassAuth("helloworld")
    FHIRClient.set_password!(username_password_auth_1, "helloworld")
    username_password_auth_2 = FHIRClient.UsernamePassAuth(; username = "helloworld")
    FHIRClient.set_password!(username_password_auth_2, "helloworld")
    all_auths = [
        anonymous_auth,
        oauth2_auth,
        jwt_auth,
        username_password_auth_1,
        username_password_auth_2,
    ]
    for auth in all_auths
        fhir_version = FHIRClient.R4()
        base_url = FHIRClient.BaseURL("https://hapi.fhir.org/baseR4")
        client = FHIRClient.Client(fhir_version, base_url, auth)
        @test FHIRClient.get_fhir_version(client) == fhir_version
        @test FHIRClient.get_base_url(client) == base_url
        search_request_path = "/Patient?given=Jason&family=Argonaut"
        json_response_search_results_bundle = FHIRClient._request_json(client, "GET", search_request_path)
        patient_id = json_response_search_results_bundle.entry[1].resource.id
        patient_request = "/Patient/$(patient_id)"
        patients = [
            FHIRClient.request(FHIRClient.R4Types.Patient, client, "GET", patient_request),
            FHIRClient.request(FHIRClient.R4Types.Patient, client, "GET", patient_request; body = JSON3.read("{}")),
            FHIRClient.request(FHIRClient.R4Types.Patient, client, "GET", patient_request; query = Dict{String, String}()),
            FHIRClient.request(FHIRClient.R4Types.Patient, client, "GET", patient_request; body = JSON3.read("{}"), query = Dict{String, String}()),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", patient_request),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", patient_request; body = JSON3.read("{}")),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", patient_request; query = Dict{String, String}()),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", patient_request; body = JSON3.read("{}"), query = Dict{String, String}()),
        ]
        for patient in patients
            @test patient isa FHIRClient.R4Types.AbstractResource
            @test patient isa FHIRClient.R4Types.Patient
            # @test only(patient.name).use == "usual"
            # @test only(patient.name).text == "Jason Argonaut"
            # @test only(patient.name).family == "Argonaut"
            # @test only(only(patient.name).given) == "Jason"
            @test patient.birthDate == Dates.Date("1985-08-01")
        end
        Base.shred!(auth)
        Base.shred!(client)
    end
    for i in 1:length(all_auths)
        Base.shred!(all_auths[i])
    end
end

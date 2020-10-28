using FHIRClient
using Test

import Dates
import HTTP
import .JSON3
import StructTypes

# query_string = "/Patient?given=Jason&family=Argonaut" # TODO: add a test for search

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
    request_path = "/Patient/1476056"
    for auth in all_auths
        fhir_version = FHIRClient.R4()
        base_url = FHIRClient.BaseURL("https://hapi.fhir.org/baseR4")
        client = FHIRClient.Client(fhir_version, base_url, auth)
        @test FHIRClient.get_fhir_version(client) == fhir_version
        @test FHIRClient.get_base_url(client) == base_url
        json_responses = [
            FHIRClient._request_json(client, "GET", request_path),
            FHIRClient._request_json(client, "GET", request_path; body = JSON3.read("{}")),
            FHIRClient._request_json(client, "GET", request_path; query = Dict{String, String}()),
            FHIRClient._request_json(client, "GET", request_path; body = JSON3.read("{}"), query = Dict{String, String}()),
        ]
        patients = [
            FHIRClient.request(FHIRClient.R4Types.Patient, client, "GET", request_path),
            FHIRClient.request(FHIRClient.R4Types.Patient, client, "GET", request_path; body = JSON3.read("{}")),
            FHIRClient.request(FHIRClient.R4Types.Patient, client, "GET", request_path; query = Dict{String, String}()),
            FHIRClient.request(FHIRClient.R4Types.Patient, client, "GET", request_path; body = JSON3.read("{}"), query = Dict{String, String}()),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", request_path),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", request_path; body = JSON3.read("{}")),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", request_path; query = Dict{String, String}()),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", request_path; body = JSON3.read("{}"), query = Dict{String, String}()),
        ]
        for patient in patients
            @test patient isa FHIRClient.R4Types.AbstractResource
            @test patient isa FHIRClient.R4Types.Patient
            @test only(patient.name).use == "usual"
            @test only(patient.name).text == "Jason Argonaut"
            @test only(patient.name).family == "Argonaut"
            @test only(only(patient.name).given) == "Jason"
            @test patient.birthDate == Dates.Date("1985-08-01")
        end
        Base.shred!(auth)
        Base.shred!(client)
    end
    for i in 1:length(all_auths)
        Base.shred!(all_auths[i])
    end
end

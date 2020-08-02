using FHIRClient

using Test

@testset "Basic test" begin
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
        endpoint = FHIRClient.Endpoint("https://hapi.fhir.org/baseR4")
        fhir_version = FHIRClient.R4()
        client = FHIRClient.Client(fhir_version, endpoint, auth)
        @test FHIRClient.get_fhir_version(client) == fhir_version
        @test FHIRClient.get_endpoint(client) == endpoint
        query = "/Patient/22692"
        response = FHIRClient.fhir_get_json(client, query)
        @test response.resourceType == "Patient"
        @test response.id == "22692"
        @test length(response.name) == 1
        @test response.name[1].text == "Jason Argonaut"
        @test response.name[1].family == "Argonaut"
        @test length(response.name[1].given) == 1
        @test response.name[1].given == String["Jason"]
    end
    for i in 1:length(all_auths)
        Base.shred!(all_auths[i])
    end
end

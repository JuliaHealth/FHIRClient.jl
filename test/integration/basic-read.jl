@testset "Basic reading" begin
    # Settings of the server and the patient used in the tests below
    # This has to be updated when switching or adding servers
    server_base_url = FHIRClient.BaseURL("https://server.fire.ly/r4")
    server_fhir_version = FHIRClient.R4()
    patient_given_name = "Sam"
    patient_family_name = "Jones"
    patient_birthdate = Dates.Date("1988-03-04")

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
        client = FHIRClient.Client(server_fhir_version, server_base_url, auth)
        @test FHIRClient.get_fhir_version(client) == server_fhir_version
        @test FHIRClient.get_base_url(client) == server_base_url
        json_response_search_results_bundle = FHIRClient.request_json(
            client,
            "GET",
            "/Patient";
            query = Dict("given" => patient_given_name, "family" => patient_family_name),
        )
        patient_id = json_response_search_results_bundle.entry[1].resource.id
        patient_request = "/Patient/$(patient_id)"
        patients = [
            FHIRClient.request(FHIRClient.R4Types.Patient, client, "GET", patient_request),
            FHIRClient.request(
                FHIRClient.R4Types.Patient,
                client,
                "GET",
                patient_request;
                body = JSON3.read("{}"),
            ),
            FHIRClient.request(
                FHIRClient.R4Types.Patient,
                client,
                "GET",
                patient_request;
                query = Dict{String,String}(),
            ),
            FHIRClient.request(
                FHIRClient.R4Types.Patient,
                client,
                "GET",
                patient_request;
                body = JSON3.read("{}"),
                query = Dict{String,String}(),
            ),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", patient_request),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", patient_request; body = JSON3.read("{}")),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", patient_request; query = Dict{String, String}()),
            # FHIRClient.request(FHIRClient.R4Types.AbstractResource, client, "GET", patient_request; body = JSON3.read("{}"), query = Dict{String, String}()),
        ]
        for patient in patients
            @test patient isa FHIRClient.R4Types.AbstractResource
            @test patient isa FHIRClient.R4Types.Patient
            @test only(patient.name).family == patient_family_name
            @test only(only(patient.name).given) == patient_given_name
            @test patient.birthDate == patient_birthdate
        end

        @testset "verbosity" begin
            request_dict(args...; kwargs...) = FHIRClient.request(Dict, args...; kwargs...)
            search_request_path = "/Patient?given=$patient_given_name&family=$patient_family_name"
            for f in (FHIRClient._request_raw, FHIRClient.request_json, request_dict)
                # In versions >= 1.0.0, HTTP.jl uses the Julia logging system for verbose information
                if isdefined(HTTP, :LoggingExtras)
                    # No logs by default and with `verbose = 0`
                    @test_logs f(client, "GET", search_request_path)
                    @test_logs f(client, "GET", search_request_path; verbose = 0)

                    # Some logs with `verbose = 1`
                    @test_logs (:debug, "GET /r4$search_request_path HTTP/1.1") (
                        :debug,
                        "HTTP/1.1 200 OK <= (GET /r4$search_request_path HTTP/1.1)",
                    ) f(client, "GET", search_request_path; verbose = 1)

                    # More logs with `verbose = 2`
                    @test_logs (:debug, "GET /r4$search_request_path HTTP/1.1") (
                        :debug,
                        "client startwrite",
                    ) (:debug, r"^HTTP\.Messages\.Request:") (:debug, "client closewrite") (
                        :debug,
                        "client startread",
                    ) (:debug, "client closeread") (
                        :debug,
                        "HTTP/1.1 200 OK <= (GET /r4$search_request_path HTTP/1.1)",
                    ) (:debug, r"HTTP\.Messages\.Response:") f(
                        client,
                        "GET",
                        search_request_path;
                        verbose = 2,
                    )
                else
                    # No information printed to stdout by default and with `verbose = 0`
                    @test isempty(
                        Suppressor.@capture_out f(client, "GET", search_request_path)
                    )
                    @test isempty(
                        Suppressor.@capture_out f(
                            client,
                            "GET",
                            search_request_path;
                            verbose = 0,
                        )
                    )

                    # Some information printed to stdout with `verbose = 1`
                    output = Suppressor.@capture_out f(
                        client,
                        "GET",
                        search_request_path;
                        verbose = 1,
                    )
                    @test occursin("GET /r4$search_request_path HTTP/1.1", output)
                    @test occursin(
                        "HTTP/1.1 200 OK <= (GET /r4$search_request_path HTTP/1.1)",
                        output,
                    )

                    # More inforrmation with `verbose = 2`
                    output = Suppressor.@capture_out f(
                        client,
                        "GET",
                        search_request_path;
                        verbose = 2,
                    )
                    @test occursin("GET /r4$search_request_path HTTP/1.1", output)
                    @test occursin("HTTP.Messages.Request:", output)
                    @test occursin("HTTP/1.1 200 OK", output)
                    @test occursin("HTTP.Messages.Response:", output)
                end
            end
        end

        Base.shred!(auth)
        Base.shred!(client)
    end
end

@testset "Raw JSON" begin
    for trailing_slash in (true, false)
        fhir_version = FHIRClient.R4()
        base_url = FHIRClient.BaseURL("https://hapi.fhir.org/baseR4" * (trailing_slash ? "/" : ""))
        auth = FHIRClient.AnonymousAuth()
        client = FHIRClient.Client(fhir_version, base_url, auth)
        search_request = "/Patient?given=Jason&family=Argonaut"
        json_response_search_results_bundle = FHIRClient.request_json(client, "GET", search_request)

        patient_id = json_response_search_results_bundle.entry[1].resource.id
        patient_request = "/Patient/$(patient_id)"
        raw_response = FHIRClient.request_raw(client, "GET", patient_request)
        @test raw_response isa String
    
        # `request_json` and `request` yield consistent results
        json_response = FHIRClient.request_json(client, "GET", patient_request)
        @test json_response isa JSON3.Object
        @test json_response == JSON3.read(raw_response)

        dict_response = FHIRClient.request(Dict, client, "GET", patient_request)
        @test dict_response isa Dict
        @test dict_response == JSON3.read(raw_response, Dict)

        # Relative paths
        for path in ("Patient/$(patient_id)", "./Patient/$(patient_id)")
            # For relative paths the `require_base_url` setting does not matter
            for sym in (:strict, :host, :scheme, :no)
                @test FHIRClient.request_raw(client, "GET", path; require_base_url = sym) == raw_response
                @test FHIRClient.request_json(client, "GET", path; require_base_url = sym) == json_response
                @test FHIRClient.request(Dict, client, "GET", path; require_base_url = sym) == dict_response
            end

            # Invalid keyword arguments
            for sym in (:yes, :host_only, :all)
                @test_throws ArgumentError FHIRClient.request_raw(client, "GET", path; require_base_url = sym)
                @test_throws ArgumentError FHIRClient.request_json(client, "GET", path; require_base_url = sym)
                @test_throws ArgumentError FHIRClient.request(Dict, client, "GET", path; require_base_url = sym)
            end
        end

        # Absolute path
        path = string(base_url.uri) * "/Patient/$(patient_id)"
        path_uri = URIs.URI(path)
    
        # Mismatch of scheme
        base_url2 = FHIRClient.BaseURL(URIs.URI(base_url.uri; scheme = path_uri.scheme == "https" ? "http" : "https"); require_https = false)
        client2 = FHIRClient.Client(fhir_version, base_url2, auth)
        @test_throws ArgumentError FHIRClient.request_raw(client2, "GET", path)
        @test_throws ArgumentError FHIRClient.request_json(client2, "GET", path)
        @test_throws ArgumentError FHIRClient.request(Dict, client2, "GET", path)
        for sym in (:strict, :host, :scheme)
            @test_throws ArgumentError FHIRClient.request_raw(client2, "GET", path; require_base_url = sym)
            @test_throws ArgumentError FHIRClient.request_json(client2, "GET", path; require_base_url = sym)
            @test_throws ArgumentError FHIRClient.request(Dict, client2, "GET", path; require_base_url = sym)
        end
        @test FHIRClient.request_raw(client2, "GET", path; require_base_url = :no) == raw_response
        @test FHIRClient.request_json(client2, "GET", path; require_base_url = :no) == json_response
        @test FHIRClient.request(Dict, client2, "GET", path; require_base_url = :no) == dict_response

        # Mismatch of host
        base_url2 = FHIRClient.BaseURL(URIs.URI(base_url.uri; host = "example.com"))
        client2 = FHIRClient.Client(fhir_version, base_url2, auth)
        @test_throws ArgumentError FHIRClient.request_raw(client2, "GET", path)
        @test_throws ArgumentError FHIRClient.request_json(client2, "GET", path)
        @test_throws ArgumentError FHIRClient.request(Dict, client2, "GET", path)
        for sym in (:strict, :host)
            @test_throws ArgumentError FHIRClient.request_raw(client2, "GET", path; require_base_url = sym)
            @test_throws ArgumentError FHIRClient.request_json(client2, "GET", path; require_base_url = sym)
            @test_throws ArgumentError FHIRClient.request(Dict, client2, "GET", path; require_base_url = sym)
        end
        for sym in (:scheme, :no)
            @test FHIRClient.request_raw(client2, "GET", path; require_base_url = sym) == raw_response
            @test FHIRClient.request_json(client2, "GET", path; require_base_url = sym) == json_response
            @test FHIRClient.request(Dict, client2, "GET", path; require_base_url = sym) == dict_response
        end

        # Mismatch of path
        base_url2 = FHIRClient.BaseURL(URIs.URI(base_url.uri; path = replace(base_url.uri.path, "/base" => "/")))
        client2 = FHIRClient.Client(fhir_version, base_url2, auth)
        @test_throws ArgumentError FHIRClient.request_raw(client2, "GET", path)
        @test_throws ArgumentError FHIRClient.request_json(client2, "GET", path)
        @test_throws ArgumentError FHIRClient.request(Dict, client2, "GET", path)
        @test_throws ArgumentError FHIRClient.request_raw(client2, "GET", path; require_base_url = :strict)
        @test_throws ArgumentError FHIRClient.request_json(client2, "GET", path; require_base_url = :strict)
        @test_throws ArgumentError FHIRClient.request(Dict, client2, "GET", path; require_base_url = :strict)
        for sym in (:host, :scheme, :no)
            @test FHIRClient.request_raw(client2, "GET", path; require_base_url = sym) == raw_response
            @test FHIRClient.request_json(client2, "GET", path; require_base_url = sym) == json_response
            @test FHIRClient.request(Dict, client2, "GET", path; require_base_url = sym) == dict_response
        end

        # Other keyword arguments
        @test FHIRClient.request_raw(client, "GET", patient_request) == raw_response
        @test FHIRClient.request_raw(client, "GET", patient_request; body = "{}") == raw_response 
        @test FHIRClient.request_raw(client, "GET", patient_request; query = Dict{String, String}()) == raw_response
        @test FHIRClient.request_raw(client, "GET", patient_request; body = "{}", query = Dict{String, String}()) == raw_response

        @test FHIRClient.request_json(client, "GET", patient_request) == json_response
        @test FHIRClient.request_json(client, "GET", patient_request; body = JSON3.read("{}")) == json_response
        @test FHIRClient.request_json(client, "GET", patient_request; query = Dict{String, String}()) == json_response
        @test FHIRClient.request_json(client, "GET", patient_request; body = JSON3.read("{}"), query = Dict{String, String}()) == json_response

        @test FHIRClient.request(Dict, client, "GET", patient_request) == dict_response 
        @test FHIRClient.request(Dict, client, "GET", patient_request; body = JSON3.read("{}")) == dict_response
        @test FHIRClient.request(Dict, client, "GET", patient_request; query = Dict{String, String}()) == dict_response
        @test FHIRClient.request(Dict, client, "GET", patient_request; body = JSON3.read("{}"), query = Dict{String, String}()) == dict_response

        Base.shred!(auth)
        Base.shred!(client)
        Base.shred!(client2)
    end
end

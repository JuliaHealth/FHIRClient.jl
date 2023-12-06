@testset "requests.jl" begin
    @testset "trailing slash" begin
        for scheme in ("http", "https"), path in ("", "/foo/bar")
            path_with_trailing_slash = path * "/"
            expected_url =
                URIs.URI(; scheme = scheme, host = "example.com", path = path * "/")
            @test FHIRClient._add_trailing_slash(
                URIs.URI(; scheme = scheme, host = "example.com", path = path),
            ) == expected_url
            @test FHIRClient._add_trailing_slash(
                URIs.URI(; scheme = scheme, host = "example.com", path = path * "/"),
            ) == expected_url
        end
    end

    @testset "full URL of requests" begin
        for base_scheme in ("http", "https"), base_path in ("", "/foo/bar")
            base_url =
                URIs.URI(; scheme = base_scheme, host = "example.com", path = base_path)
            base_url_w_trailing_slash = URIs.URI(;
                scheme = base_scheme,
                host = "example.com",
                path = base_path * "/",
            )

            # Requests that should be treated relative to the base URL
            path = "Patient/25"
            expected_url = URIs.URI(;
                scheme = base_scheme,
                host = "example.com",
                path = base_path * "/" * path,
            )
            for request_path in (path, "./" * path, "/" * path)
                @test FHIRClient._generate_full_url(base_url, request_path) == expected_url
                @test FHIRClient._generate_full_url(
                    base_url_w_trailing_slash,
                    request_path,
                ) == expected_url
            end

            # Requests that should be treated as absolute URLs
            path = "/r4/Patient/25"
            for request_scheme in ("http", "https")
                request_url =
                    URIs.URI(; scheme = request_scheme, host = "example2.org", path = path)
                request_path = string(request_url)
                @test FHIRClient._generate_full_url(base_url, request_path) == request_url
                @test FHIRClient._generate_full_url(
                    base_url_w_trailing_slash,
                    request_path,
                ) == request_url
            end
        end
    end

    @testset "tryparse_json" begin
        for json_body in ("42", "{}", "{\"firstName\":\"John\", \"lastName\":\"Doe\"}")
            @test (@test_logs min_level = Logging.Debug FHIRClient.tryparse_json(
                json_body,
            )) == JSON3.read(json_body)
        end
        for no_json_body in ("{3}", "[ 4 }", "{\"firstName\":John}")
            logger = Test.TestLogger(; min_level = Logging.Debug)
            res = Logging.with_logger(logger) do
                FHIRClient.tryparse_json(no_json_body)
            end
            @test res === nothing
            log = only(logger.logs)
            @test log.message == "FHIRClient.tryparse_json()"
            @test log.level == Logging.LogLevel(-1_000)
            @test length(log.kwargs) == 2
            @test log.kwargs[:exception] isa Tuple{<:Exception,<:Any}
            @test log.kwargs[:response_body] == no_json_body
        end
    end
end

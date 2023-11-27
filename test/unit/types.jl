@testset "BaseURL constructor" begin
    https_uris = ["https://example.com", URIs.URI("https://example.com")]
    @testset for uri in https_uris
        @test FHIRClient.BaseURL(uri) isa FHIRClient.BaseURL
        @test FHIRClient.BaseURL(uri; require_https = true) isa FHIRClient.BaseURL
        @test FHIRClient.BaseURL(uri; require_https = false) isa FHIRClient.BaseURL
    end

    http_uris = ["http://example.com", URIs.URI("http://example.com")]
    @testset for uri in http_uris
        @test_throws Exception FHIRClient.BaseURL(uri)
        @test_throws Exception FHIRClient.BaseURL(uri; require_https = true)
        @test FHIRClient.BaseURL(uri; require_https = false) isa FHIRClient.BaseURL
        @test_logs (:warn,) match_mode = :any FHIRClient.BaseURL(uri; require_https = false)
    end
end

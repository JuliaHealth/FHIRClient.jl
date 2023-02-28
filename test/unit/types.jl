@testset "BaseURL constructor"
    https_uris = ["https://example.com", HTTP.URI("https://example.com")]
    @testset for uri in uris
        @test_throws FHIRClient.BaseURL(HTTP.URI("http://example.com")) isa FHIRClient.BaseURL
        @test_throws FHIRClient.BaseURL(HTTP.URI("http://example.com"); require_https = true) isa FHIRClient.BaseURL
        @test_throws FHIRClient.BaseURL(HTTP.URI("http://example.com"); require_https = false) isa FHIRClient.BaseURL
    end

    http_uris = ["http://example.com", HTTP.URI("http://example.com")]
    @testset for uri in uris
        @test_throws Exception FHIRClient.BaseURL(HTTP.URI("http://example.com"))
        @test_throws Exception FHIRClient.BaseURL(HTTP.URI("http://example.com"); require_https = true)
        @test FHIRClient.BaseURL(HTTP.URI("http://example.com"); require_https = false) isa FHIRClient.BaseURL
        @test_logs (:warn,) match_mode=:any FHIRClient.BaseURL(HTTP.URI("http://example.com"); require_https = false)
    end
end

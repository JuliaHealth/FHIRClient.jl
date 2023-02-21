@test_throws Exception FHIRClient.BaseURL(HTTP.URI("http://example.com"); require_https = true)
@test FHIRClient.BaseURL(HTTP.URI("http://example.com"); require_https = false) isa FHIRClient.BaseURL
@test_logs (:warn,) match_mode=:any FHIRClient.BaseURL(HTTP.URI("http://example.com"); require_https = false)

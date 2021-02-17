@testset "requests.jl" begin
    @test FHIRClient._add_trailing_slash(HTTP.URI("https://example.com")) == HTTP.URI("https://example.com/")
    @test FHIRClient._add_trailing_slash(HTTP.URI("https://example.com/")) == HTTP.URI("https://example.com/")
end

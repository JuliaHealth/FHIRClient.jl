using FHIRClient

using HTTP
using Test

@testset "version" begin
    @test FHIRClient.version() isa VersionNumber
    @test FHIRClient.version() > v"0"
    @test FHIRClient.fhir_version(FHIRClient.R4()) isa VersionNumber
    @test FHIRClient.fhir_version(FHIRClient.R4()) > v"0"
    @test FHIRClient.fhir_version(FHIRClient.R4()) == FHIRClient.FHIR_VERSION_R4
end

@testset "_add_trailing_slash" begin
    @test FHIRClient._add_trailing_slash(HTTP.URI("https://juliahealth.org")) == HTTP.URI("https://juliahealth.org/")
    @test FHIRClient._add_trailing_slash(HTTP.URI("https://juliahealth.org/")) == HTTP.URI("https://juliahealth.org/")
end

@testset "write request body" begin
    @test FHIRClient._write_json_request_body(JSON3.read("{}")) == "{}"
    @test FHIRClient._write_struct_request_body(JSON3.read("{}")) == "{}"
end

@testset "HTTP verbs" begin
    @test FHIRClient._is_valid_http_verb("DELETE")
    @test FHIRClient._is_valid_http_verb("GET")
    @test FHIRClient._is_valid_http_verb("HEAD")
    @test FHIRClient._is_valid_http_verb("OPTIONS")
    @test FHIRClient._is_valid_http_verb("PATCH")
    @test FHIRClient._is_valid_http_verb("POST")
    @test FHIRClient._is_valid_http_verb("PUT")
    @test FHIRClient._is_valid_http_verb("TRACE")
    @test !FHIRClient._is_valid_http_verb("get")
    @test_throws ArgumentError FHIRClient._assert_is_valid_http_verb("get")
end

using FHIRClient
using Test

import Documenter
import Generate

@testset "Doctests" begin
    @testset "FHIRClient doctests" begin
        Documenter.doctest(FHIRClient)
    end
    @testset "Generate doctests" begin
        Documenter.doctest(Generate; manual = joinpath(dirname(@__DIR__), "docs", "src"))
    end
end

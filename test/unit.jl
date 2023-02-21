@testset "Unit tests" begin
    include("unit/auto-generated-source-files.jl")
    include("unit/fhir-to-julia.jl")
    include("unit/other-fhir-versions.jl")
    include("unit/requests.jl")
    include("unit/types.jl")
end

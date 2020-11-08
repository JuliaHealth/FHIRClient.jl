module Generate

include(joinpath(dirname(dirname(@__DIR__)), "vendored", "StructTypes.jl", "src", "StructTypes.jl"))
import .StructTypes
import Parsers
include(joinpath(dirname(dirname(@__DIR__)), "vendored", "JSON3.jl", "src", "JSON3.jl"))
import .JSON3

import Downloads
import .JSON3
import .StructTypes
import ZipFile

export download_fhir_json_schema
export output_fhir_types

include("types.jl")

include(joinpath(dirname(dirname(@__DIR__)), "src", "fhir-to-julia.jl"))
include("download.jl")
include("generate-fhir-types.jl")
include("map-fhir-types.jl")

end # end module Generate

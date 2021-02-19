module Generate

import Downloads
import JSON3
import StructTypes
import ZipFile

export download_fhir_json_schema
export output_fhir_types

include("types.jl")

include(joinpath(dirname(dirname(@__DIR__)), "src", "fhir-to-julia.jl"))
include("download.jl")
include("generate-fhir-types.jl")
include("map-fhir-types.jl")

end # end module Generate

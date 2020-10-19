module Generate

import Bijections
import Downloads
import JSON3
import SaferIntegers
import SimplePosets
import StructTypes
import ZipFile

export download_fhir_json_schema
export generate_fhir_types

include("types.jl")

include(joinpath(dirname(dirname(@__DIR__)), "src", "fhirname-to-julianame.jl"))
include("download.jl")
include("generate-fhir-types.jl")

end

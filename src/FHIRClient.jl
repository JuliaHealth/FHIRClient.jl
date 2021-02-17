module FHIRClient

include(joinpath(dirname(@__DIR__), "vendored", "StructTypes.jl", "src", "StructTypes.jl"))
import .StructTypes
import Parsers
include(joinpath(dirname(@__DIR__), "vendored", "JSON3.jl", "src", "JSON3.jl"))
import .JSON3

import Base64
import Dates
import HTTP
# import JSON3
import .JSON3
import SaferIntegers
# import StructTypes
import .StructTypes
import TimeZones

include("types.jl")

include("r4.jl")

include("credentials.jl")
include("fhir-to-julia.jl")
include("headers.jl")
include("other-fhir-versions.jl")
include("requests.jl")

end # end module FHIRClient

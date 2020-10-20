module FHIRClient

import Base64
import Bijections
import Dates
import HTTP
import JSON3
import SaferIntegers
import StructTypes
import TimeZones

include("types.jl")
include("fhir-releases.jl")

include("fhirname-to-julianame.jl")

end

module FHIRClient

import Base64
import Dates
import HTTP
import JSON3
import Logging
import SaferIntegers
import StructTypes
import TimeZones
import URIs

using Logging: @logmsg, LogLevel

include("types.jl")

include("r4.jl")

include("credentials.jl")
include("fhir-to-julia.jl")
include("headers.jl")
include("other-fhir-versions.jl")
include("requests.jl")
include("tryparse.jl")

end # end module FHIRClient

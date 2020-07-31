module FHIRClient

import DocStringExtensions
import HTTP
import HealthBase
import JSON3
# import OMOPCommonDataModel
import Pkg
import StructTypes

export FHIRType
export FHIRVersion

include("types.jl")

struct R4 <: FHIRVersion end
const FHIR_VERSION_R4 = v"4.0.1"
include("version.jl")

include("requests.jl")

end # end module FHIRClient

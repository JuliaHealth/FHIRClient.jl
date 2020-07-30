module FHIRClients

import HTTP
import HealthBase
import JSON3
# import OMOPCommonDataModel

export FHIRBaseURL
export FHIRClient
export FHIREndpoint
export FHIRType

include("types.jl")

include("requests.jl")

end # end module FHIRClients

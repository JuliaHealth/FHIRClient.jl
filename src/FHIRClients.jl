module FHIRClients

import HTTP
import JSON3
# import OMOPCommonDataModel

export FHIRType

"""
A `FHIRType` is a Julia type representation of a FHIR object.
"""
abstract type FHIRType end

end # end module FHIRClients

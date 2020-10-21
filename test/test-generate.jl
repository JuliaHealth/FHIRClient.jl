using FHIRClient
using Test

import Generate

@testset "Generate" begin
    url = "https://www.hl7.org/fhir/R4/definitions.json.zip"
    definitions = Generate.download_fhir_json_schema(url)
    schema_parsed = Generate.generate_fhir_types(definitions["fhir.schema.json.zip"]["fhir.schema.json"])
end

```@meta
CurrentModule = FHIRClient
```

# Examples

```julia
julia> using FHIRClient

julia> using DataFrames, StructArrays, Tables

julia> endpoint = FHIRClient.Endpoint("https://hapi.fhir.org/baseR4")
FHIRClient.Endpoint(HTTP.URI("https://hapi.fhir.org/baseR4"))

julia> fhir_version = FHIRClient.R4()
FHIRClient.R4()

julia> auth = FHIRClient.AnonymousAuth()
FHIRClient.AnonymousAuth()

julia> client = FHIRClient.Client(fhir_version, endpoint, auth)
FHIRClient.Client{FHIRClient.R4,FHIRClient.AnonymousAuth}(FHIRClient.R4(), FHIRClient.Endpoint(HTTP.URI("https://hapi.fhir.org/baseR4")), FHIRClient.AnonymousAuth())

julia> patient1 = FHIRClient.fhir_get_struct(client, "/Patient/22692", FHIRClient.FHIRPatient)
FHIRClient.FHIRPatient("Patient", "22692", FHIRClient.FHIRMeta("2", "2019-12-13T19:29:48.520+00:00", "#iJwIftqIuKvSfrIv"), FHIRClient.FHIRText("generated", "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div class=\"hapiHeaderText\">Jason <b>ARGONAUT </b></div><table class=\"hapiPropertyTable\"><tbody><tr><td>Identifier</td><td>E3826</td></tr><tr><td>Address</td><td><span>1979 Milky Way Dr. </span><br/><span>Verona </span><span>WI </span><span>US </span></td></tr><tr><td>Date of birth</td><td><span>01 August 1985</span></td></tr></tbody></table></div>"), FHIRClient.FHIRExtension[FHIRClient.FHIRExtension("http://hl7.org/fhir/StructureDefinition/us-core-race", FHIRClient.FHIRCodeableConcept(FHIRClient.FHIRCoding[FHIRClient.FHIRCoding("2.16.840.1.113883.5.104", "2028-9", "Asian")], "Asian")), FHIRClient.FHIRExtension("http://hl7.org/fhir/StructureDefinition/us-core-ethnicity", FHIRClient.FHIRCodeableConcept(FHIRClient.FHIRCoding[FHIRClient.FHIRCoding("2.16.840.1.113883.5.50", "2186-5", "Not Hispanic or Latino")], "Not Hispanic or Latino")), FHIRClient.FHIRExtension("http://hl7.org/fhir/StructureDefinition/us-core-birth-sex", FHIRClient.FHIRCodeableConcept(FHIRClient.FHIRCoding[FHIRClient.FHIRCoding("http://hl7.org/fhir/v3/AdministrativeGender", "M", "Male")], "Male"))], FHIRClient.FHIRIdentifier[FHIRClient.FHIRIdentifier("usual", "urn:oid:1.2.840.114350.1.13.327.1.7.5.737384.0", "E3826"), FHIRClient.FHIRIdentifier("usual", "urn:oid:1.2.3.4", "203579")], true, FHIRClient.FHIRName[FHIRClient.FHIRName("usual", "Jason Argonaut", "Argonaut", ["Jason"])], FHIRClient.FHIRCodeableConcept[FHIRClient.FHIRCodeableConcept(missing, missing), FHIRClient.FHIRCodeableConcept(missing, missing), FHIRClient.FHIRCodeableConcept(missing, missing), FHIRClient.FHIRCodeableConcept(missing, missing), FHIRClient.FHIRCodeableConcept(missing, missing), FHIRClient.FHIRCodeableConcept(missing, missing)], "male", "1985-08-01", false, FHIRClient.FHIRAddress[FHIRClient.FHIRAddress("home", ["1979 Milky Way Dr."], "Verona", "WI", "53593", "US"), FHIRClient.FHIRAddress("temp", ["5301 Tokay Blvd"], "MADISON", "WI", "53711", "US")], FHIRClient.FHIRCodeableConcept(FHIRClient.FHIRCoding[FHIRClient.FHIRCoding("http://hl7.org/fhir/ValueSet/marital-status", "S", "Never Married")], "Single"), FHIRClient.FHIRCommunication[FHIRClient.FHIRCommunication(missing, true)], FHIRClient.FHIRGeneralPractitioner[FHIRClient.FHIRGeneralPractitioner("Practitioner/338866", "Physician Family Medicine")])

julia> typeof(patient1)
FHIRClient.FHIRPatient

julia> patient1.name
1-element Vector{FHIRClient.FHIRName}:
 FHIRClient.FHIRName("usual", "Jason Argonaut", "Argonaut", ["Jason"])

julia> patient1.birthDate
"1985-08-01"

julia> patient2 = FHIRClient.fhir_get_struct(client, "/Patient/1227306", FHIRClient.FHIRPatient)
FHIRClient.FHIRPatient("Patient", "1227306", FHIRClient.FHIRMeta("1", "2020-06-19T13:55:09.498+00:00", "#RmgibCwFUwNrHlw1"), FHIRClient.FHIRText("generated", "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div class=\"hapiHeaderText\">Jason <b>GLOVER </b></div><table class=\"hapiPropertyTable\"><tbody><tr><td>Identifier</td><td>CT10681</td></tr></tbody></table></div>"), missing, FHIRClient.FHIRIdentifier[FHIRClient.FHIRIdentifier(missing, missing, "CT10681"), FHIRClient.FHIRIdentifier(missing, missing, "9800005998")], missing, FHIRClient.FHIRName[FHIRClient.FHIRName(missing, missing, "Glover", ["Jason"])], missing, "male", missing, missing, missing, missing, missing, missing)

julia> typeof(patient2)
FHIRClient.FHIRPatient

julia> patient2.name
1-element Vector{FHIRClient.FHIRName}:
 FHIRClient.FHIRName(missing, missing, "Glover", ["Jason"])

julia> patient2.birthDate
missing

julia> patient_table = StructArray(FHIRClient.FHIRPatient[patient1, patient2]);

julia> patient_table_df = DataFrame(patient_table);

julia> Base.shred!(auth)

julia> Base.shred!(client)
```

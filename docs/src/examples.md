```@meta
CurrentModule = FHIRClient
```

# Examples

```jldoctest
julia> using FHIRClient

julia> endpoint = FHIRClient.Endpoint("https://hapi.fhir.org/baseR4")
FHIRClient.Endpoint(HTTP.URI("https://hapi.fhir.org/baseR4"))

julia> fhir_version = FHIRClient.R4()
FHIRClient.R4()

julia> auth = FHIRClient.AnonymousAuth()
FHIRClient.AnonymousAuth()

julia> client = FHIRClient.Client(fhir_version, endpoint, auth)
FHIRClient.Client{FHIRClient.R4,FHIRClient.AnonymousAuth}(FHIRClient.R4(), FHIRClient.Endpoint(HTTP.URI("https://hapi.fhir.org/baseR4")), FHIRClient.AnonymousAuth())

julia> response = FHIRClient.fhir_get_json(client, "/Patient/22692")
JSON3.Object{Base.CodeUnits{UInt8,String},Vector{UInt64}} with 16 entries:
  :resourceType        => "Patient"
  :id                  => "22692"
  :meta                => {…
  :text                => {…
  :extension           => JSON3.Object[{…
  :identifier          => JSON3.Object[{…
  :active              => true
  :name                => JSON3.Object[{…
  :telecom             => JSON3.Object[{…
  :gender              => "male"
  :birthDate           => "1985-08-01"
  :deceasedBoolean     => false
  :address             => JSON3.Object[{…
  :maritalStatus       => {…
  :communication       => JSON3.Object[{…
  :generalPractitioner => JSON3.Object[{…

julia> response.id
"22692"

julia> response.name
1-element JSON3.Array{JSON3.Object,Base.CodeUnits{UInt8,String},SubArray{UInt64,1,Vector{UInt64},Tuple{UnitRange{Int64}},true}}:
 {
      "use": "usual",
     "text": "Jason Argonaut",
   "family": "Argonaut",
    "given": [
               "Jason"
             ]
}

julia> response.birthDate
"1985-08-01"
```

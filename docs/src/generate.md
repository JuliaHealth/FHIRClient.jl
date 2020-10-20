```@meta
CurrentModule = Generate
```

# Auto-generating the type definitions

## Example usage

```@example
using Generate
url = "https://www.hl7.org/fhir/R4/definitions.json.zip"
definitions = Generate.download_fhir_json_schema(url)
schema_parsed = Generate.generate_fhir_types(definitions["fhir.schema.json.zip"]["fhir.schema.json"])
sqrt(9)
sqrt(-16)
sqrt(25)
```

## Index

```@index
Modules = [Generate]
```

## Docs

```@autodocs
Modules = [Generate]
```

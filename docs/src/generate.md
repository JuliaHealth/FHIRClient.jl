```@meta
CurrentModule = Generate
```

# Auto-generating the type definitions

## Example usage

```@repl
using Generate
url = "https://www.hl7.org/fhir/R4/definitions.json.zip"
definitions = Generate.download_fhir_json_schema(url)
schema_parsed = Generate.generate_fhir_types(definitions["fhir.schema.json.zip"]["fhir.schema.json"])
throw(ErrorException("This is an exception"))
```

## Index

```@index
Modules = [Generate]
```

## Docs

```@autodocs
Modules = [Generate]
```

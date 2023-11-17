"""
    download_fhir_json_schema(url::AbstractString)

Download and unzip the file at `url`.

## Example
```julia
julia> url = "https://www.hl7.org/fhir/R4/definitions.json.zip"
julia> Generate.download_fhir_json_schema(url)
```
"""
@inline function download_fhir_json_schema(url::AbstractString)
    io = IOBuffer()
    Downloads.download(url, io)
    r = ZipFile.Reader(io)
    return _process_zip_reader(r)
end

@inline function _process_zip_reader(r::ZipFile.Reader)
    result = Dict{String,Union{String,Dict}}()
    files = r.files
    for i = 1:length(files)
        file = files[i]
        filename = file.name
        result[filename] = _process_zip_file(filename, file)
    end
    return result
end

@inline function _process_zip_file(filename::AbstractString, file::ZipFile.ReadableFile)
    filecontents = read(file, String)::String
    if endswith(lowercase(strip(filename)), ".zip")
        io = IOBuffer(filecontents)
        r = ZipFile.Reader(io)
        return _process_zip_reader(r)
    end
    return filecontents
end

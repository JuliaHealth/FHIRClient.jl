function json_headers!(headers::AbstractDict)
    headers["Accept"] = "application/json"
    headers["Content-Type"] = "application/json"
    return headers
end

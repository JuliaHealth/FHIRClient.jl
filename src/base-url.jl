"""
Construct a `BaseURL` object given the base URL.

The base URL is also called the "Service Root URL"
"""
BaseURL(base_url::AbstractString) = BaseURL(HTTP.URI(base_url))

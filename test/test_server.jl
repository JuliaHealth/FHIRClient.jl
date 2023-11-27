Base.@kwdef struct TestFHIRServer
    base_url_str::String = "https://server.fire.ly/r4"
    patient1_firstname::String = "Sam"
    patient1_lastname::String = "Jones"
    patient1_dob_str::String = "1988-03-04"
end

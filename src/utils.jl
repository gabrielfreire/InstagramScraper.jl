module Util
using HTTP

export fetch_body

function fetch_body(url::String)::String

    if (isempty(url))
        error("URL not found")
    end
    
    try
        response::HTTP.Response = HTTP.get(url)
        if (response.status == 200)
            return String(response.body)
        else
            error("Something wrong happened | HTTP STATUS | $(response.status)")
        end
    catch e
        error(e)
    end
end

precompile(fetch_body, (String,))
end # module
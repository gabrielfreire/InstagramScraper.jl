module Util
using HTTP
function fetch_body(url::String)::String

    if (isempty(url))
        error("URL not found")
    end
    
    try
        response::HTTP.Response = HTTP.get(url)
        if (response.status == 200)
            return String(response.body)::String
        else
            error("Something wrong happened | HTTP STATUS | $(response.status)")
        end
    catch e
        error(e)
    end
end

export fetch_body
precompile(fetch_body, (String,))
end # module
using HTTP
function fetch_body(url::String)::String

    if (isempty(url))
        error("URL not found")
    end
    
    try
        response = HTTP.get(url)
        if (response.status == 200)
            return String(response.body)
        else
            error("Something wrong happened | HTTP STATUS | $(response.status)")
        end
    catch e
        error(e)
    end
end

export fetch_body
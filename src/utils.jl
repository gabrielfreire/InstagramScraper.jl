using HTTP:get

function fetch_body(url::String)::String
    if (isempty(url))
        error("URL not found")
    end
    
    @info "Fetching $url !"
    
    try
        response = get(url)
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
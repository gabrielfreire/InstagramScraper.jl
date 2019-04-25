using HTTP:get


"""
    @jit ...
The `@jit` annotation can be applied to any code, and the code will be compiled
for performance.
    @jit f(x) = @jit(x) + @jit(x)
Note that compilation happens regardless of the `@jit` macro, so it should only
be used for aesthetic purposes, or by recovering Python users.
"""
macro jit(ex)
    esc(ex)
end


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


export @jit, fetch_body
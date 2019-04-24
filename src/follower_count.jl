using HTTP:get 
using Cascadia: @sel_str
using Gumbo:parsehtml, text
using JSON

include("utils.jl");

struct InstagramProfile
    name::String
    personal_url::String
    followers::Int32
end

function Base.print(value::InstagramProfile)
    println("$(value.name) at $(value.personal_url) has $(value.followers) followers")
end

function Base.print(results::Array{InstagramProfile, 1})
    for res in results
        print(res)
    end
end

function get_followers(url::String)::InstagramProfile
    f_url = "https://www.instagram.com/" * url
    @info "Fetching $f_url !"
    try
        r = get(f_url)
        if r.status == 200
            body::String = String(r.body)
            
            # parse html
            html = parsehtml(body)

            # select scripts
            scripts = eachmatch(@sel_str("script[type='application/ld+json']"), html.root)
            
            # scripts[1]    = First script tag
            # scripts[1][1] = content of first script tag
            scripts_content = JSON.parse(strip(text(scripts[1][1])))
            main_entity_of_page = scripts_content["mainEntityofPage"];
            interaction_statistics = main_entity_of_page["interactionStatistic"];
     
            name = String(scripts_content["name"])
            profile = String("url" in collect(keys(scripts_content)) ? scripts_content["url"] : "No personal URL")
            followers_count = parse(Int32, interaction_statistics["userInteractionCount"]);
            
            return InstagramProfile(name, profile, followers_count)
        end
    catch e
        print("Something wrong happened :> $e");
        return 0
    end
end

function get_multiple_followers(profiles::Array{String, 1}, printable::Bool)::Array{InstagramProfile, 1}
    arr::Array{InstagramProfile, 1} = []
    @time begin
        @sync for prof in profiles
            @async push!(arr, get_followers(prof));
        end
    end
    
    if printable
        print(arr)
    end

    return arr
end


export get_multiple_followers
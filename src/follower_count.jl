using Cascadia
using JSON

import Cascadia.Gumbo


export get_multiple_followers

struct InstagramProfile
    name::String
    url::String
    personal_url::String
    followers::Int64
    InstagramProfile(name, url, personal_url, followers) = new(name, url, personal_url, followers)
end


function Base.show(io::IO, ip::InstagramProfile)
    printstyled("\n\t------------------------------------------\n", color=:light_blue)
    printstyled("\n\tNAME: \t$(ip.name)",                           color=:light_green)
    printstyled("\n\tURL: \t$(ip.url)",                             color=:green)
    printstyled("\n\tPERSONAL URL: \t$(ip.personal_url)",           color=:light_green)
    printstyled("\n\tFOLLOWERS: \t$(ip.followers)",                 color=:green)
    printstyled("\n\t------------------------------------------\n", color=:light_blue)
end


function Base.print(results::Array{InstagramProfile, 1})
    for res in results
        show(res)
    end
end


function get_followers(profile_name::String="")::Union{InstagramProfile, Nothing}
    
    if (isempty(profile_name))
        error("Profile name not found")
    end

    url::String = "https://www.instagram.com/$profile_name"
    try
        body::String = fetch_body(url)
        # parse html
        html = Gumbo.parsehtml(body)
        # select scripts
        scripts = eachmatch(Cascadia.@sel_str("script[type='application/ld+json']"), html.root)
        # scripts[1]    = First script tag
        # scripts[1][1] = content of first script tag
        scripts_content = JSON.parse(strip(Gumbo.text(scripts[1][1])))
        main_entity_of_page = scripts_content["mainEntityofPage"];
        interaction_statistics = main_entity_of_page["interactionStatistic"];
    
        name::String = String(scripts_content["name"])
        profile::String = String("url" in collect(keys(scripts_content)) ? 
                                        scripts_content["url"] : 
                                        "No personal URL")
        
        followers_count::Int64 = Base.parse(Int64, interaction_statistics["userInteractionCount"]);
        return InstagramProfile(name, url, profile, followers_count)
    
    catch e
        error("Something wrong happened :> $e");
    end
end


function get_multiple_followers(profiles::Array{String, 1}=[], printable::Bool=false)::Array{InstagramProfile, 1}
    arr::Array{InstagramProfile, 1} = []

    if (length(profiles) == 0) 
        return arr 
    end
    
    @time begin
        @sync for prof in profiles
            profile::Union{InstagramProfile, Nothing} = get_followers(prof)
            if profile == nothing 
                continue 
            end
            @async push!(arr, profile);
        end
    end
    
    if (printable)
        print(arr)
    end

    return arr
end

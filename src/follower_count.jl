struct InstagramProfile
    name::String
    personal_url::String
    followers::Int64
end


function Base.show(io::IO, ip::InstagramProfile)
    print(io, "$(ip.name) at $(ip.personal_url) has $(ip.followers) followers\n")
end


function Base.print(results::Array{InstagramProfile, 1})
    for res in results
        show(res)
    end
end


function get_followers(profile_name::String="")::InstagramProfile
    
    if (isempty(profile_name))
        error("Profile name not found")
    end

    url = "https://www.instagram.com/" * profile_name
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
    
        name = String(scripts_content["name"])
        profile = String("url" in collect(keys(scripts_content)) ? 
                                        scripts_content["url"] : 
                                        "No personal URL")
        
        followers_count = Base.parse(Int64, interaction_statistics["userInteractionCount"]);
        return InstagramProfile(name, profile, followers_count)
    
    catch e
        print("Something wrong happened :> $e");
        return 0
    end
end


function get_multiple_followers(profiles::Array{String, 1}=[], printable::Bool=false)::Array{InstagramProfile, 1}
    arr::Array{InstagramProfile, 1} = []

    if (length(profiles) == 0) 
        return arr 
    end
    
    @time begin
        @sync for prof in profiles
            @async push!(arr, get_followers(prof));
        end
    end
    
    if (printable)
        print(arr)
    end

    return arr
end


export get_multiple_followers
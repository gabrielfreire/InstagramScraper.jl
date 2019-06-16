module FollowerCount

using Cascadia
using JSON

import Cascadia.Gumbo

include("utils.jl")

export get_multiple_followers
 
struct InstagramProfile
    name::String
    url::String
    personal_url::String
    followers::Int
    InstagramProfile(name, url, personal_url, followers) = new(name, url, personal_url, followers)
end


function Base.show(ip::InstagramProfile)
    printstyled("\n\t------------------------------------------\n", color=:light_blue)
    printstyled("\n\tNAME: \t$(ip.name)",                           color=:light_green)
    printstyled("\n\tURL: \t$(ip.url)",                             color=:green)
    printstyled("\n\tPERSONAL URL: \t$(ip.personal_url)",           color=:light_green)
    printstyled("\n\tFOLLOWERS: \t$(ip.followers)\n",                 color=:green)
    printstyled("\n\t------------------------------------------\n", color=:light_blue)
end


function Base.print(io::IO, results::Array{InstagramProfile, 1})
    for res::InstagramProfile in results
        show(res)
    end
end


function get_followers(body::String, url::String)::Union{Nothing, InstagramProfile}
    
    if (isempty(body))
        error("Profile name not found")
    end

    try
        # parse html
        html::Gumbo.HTMLDocument = Gumbo.parsehtml(body)

        # select scripts
        scripts::Vector{Gumbo.HTMLNode} = eachmatch(Cascadia.@sel_str("script[type='application/ld+json']"), html.root)
        # scripts[1]    = First script tag
        # scripts[1][1] = content of first script tag
        if (length(scripts) > 0)
            scripts_content::Union{Nothing, Dict{String, Any}} = JSON.parse(strip(Gumbo.text(scripts[1][1])))
            interaction_statistics::Union{Nothing, Dict{String, Any}} = scripts_content["mainEntityofPage"]["interactionStatistic"];
            name::String = String(scripts_content["name"])
            profile::String = String("url" in haskey(scripts_content, "url") ? 
                                            scripts_content["url"] : 
                                            "No personal URL")

            
            followers_count::Int = Base.parse(Int, interaction_statistics["userInteractionCount"]);

            interaction_statistics = nothing
            scripts_content = nothing

            return InstagramProfile(name, url, profile, followers_count)::InstagramProfile
        end
        return nothing
    catch e
        error("Something wrong happened :> $e");
    end
end


function get_multiple_followers(profiles::Vector{String}=[], printable::Bool=false)::Vector{InstagramProfile}
    @time begin
        arr::Vector{InstagramProfile} = InstagramProfile[]

        if (length(profiles) == 0) 
            return arr::Vector{InstagramProfile} 
        end

        profile_generator = (p::String for p = profiles)

        empty(profiles)

        @sync for prof::String in profile_generator
            url::String = "https://www.instagram.com/$prof"
            @async begin
                body::String = Util.fetch_body(url)
                instagram_profile::Union{Nothing, InstagramProfile} = get_followers(body, url)
                if instagram_profile == nothing
                    printstyled("\n\t$prof was not found\n", color=:light_red)
                else
                    push!(arr, instagram_profile);
                end
            end
        end
    end
    
    if (printable)
        print(arr)
    end

    return arr::Vector{InstagramProfile}
end

precompile(get_multiple_followers, (Vector{String}, Bool))
precompile(get_followers, (String, String))
precompile(Base.show, (InstagramProfile,))
precompile(Base.print, (IO, Array{InstagramProfile, 1}))
end # module

__precompile__(true)
module InstagramScraper


using HTTP:get 
using Cascadia: @sel_str
using Gumbo:parsehtml, text
using JSON

struct InstagramProfile
    name::String
    followers::Int32
end

function get_followers(url::String)::Int32
    f_url = "https://www.instagram.com/" * url
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
            followers_count = interaction_statistics["userInteractionCount"];
            return parse(Int32, followers_count)
        end
    catch e
        print("Something wrong happened $e");
        return 0
    end
end

function get_multiple_followers(profiles::Array{String, 1})::Array{InstagramProfile, 1}
    arr::Array{InstagramProfile, 1} = []
    @time begin
        @sync for prof in profiles
            @async push!(arr, InstagramProfile(prof, get_followers(prof)));
        end
    end
    return arr
end

function Base.print(value::InstagramProfile)
    println("$(value.name) has $(value.followers) followers")
end

function Base.print(results::Array{InstagramProfile, 1})
    for res in results
        print(res)
    end
end

function main(ARGS::Vector{String})
    if length(ARGS) > 0 && length(ARGS) < 15
        res = get_multiple_followers(ARGS)
        print(res)
    else
        print("\nNo arguments found\n\tUsage ./InstagramScraper {instagram_profile_name1} {instagram_profile_name2} {instagram_profile_name3}\n")
    end
end

# main(ARGS)  # call your program's logic.
Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    main(ARGS)  # call your program's logic.
    return 0
end
export get_followers, get_multiple_followers, julia_main


end

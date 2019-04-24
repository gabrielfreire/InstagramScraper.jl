__precompile__(true)
module InstagramScraper
include("follower_count.jl")

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    if length(ARGS) > 0 && length(ARGS) < 15
        get_multiple_followers(ARGS, true)
    else
        print("\nNo arguments found\n\tUsage ./InstagramScraper {instagram_profile_name1} {instagram_profile_name2} {instagram_profile_name3}\n")
    end
    return 0
end


export julia_main

# julia_main(ARGS);

end

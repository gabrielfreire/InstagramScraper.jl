module InstagramScraper
include("utils.jl");
include("follower_count.jl")

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    if length(ARGS) > 0 && length(ARGS) < 15
        get_multiple_followers(ARGS, true)
    else
        print("\nNo arguments found\n\tUsage ./InstagramScraper {instagram_profile_name1} {instagram_profile_name2} {instagram_profile_name3}\n")
    end
    return 0
end

julia_main(ARGS)

end

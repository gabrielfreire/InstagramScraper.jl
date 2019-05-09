Base.eval(:(have_color = true))
module InstagramScraper

# this only executes in compile time
include("libreplacements.jl")

# other includes
include("utils.jl");
include("follower_count.jl")

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    
    # Check if it is my program and not PackageCompiler
    if occursin("InstagramScraper.exe", PROGRAM_FILE)
        this_path = abspath(dirname(PROGRAM_FILE))
        # cd there otherwise it won't find the libraries
        cd(this_path)
    end
    
    if length(ARGS) > 0 && length(ARGS) < 15
        get_multiple_followers(ARGS, true)
    else
        printstyled("\nNo arguments found\n\tUsage \n\t./InstagramScraper {instagram_profile_name1} {instagram_profile_name2} {instagram_profile_name3}\n", color=:light_yellow)
    end
    return 0
end

julia_main(ARGS)

end

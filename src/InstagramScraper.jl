Base.eval(:(have_color = true))
module InstagramScraper

export FollowerCount

# this only executes in compile time
include("libreplacements.jl")

# compilation step
cur_compilepath = relpath(".", "..\\..\\..")
adjust = !occursin("bin", cur_compilepath)
ResourceRep.make_replacement(adjust)

# other includes
include("follower_count.jl")

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    
    # Check if it is my program and not PackageCompiler
    if occursin("InstagramScraper.exe", PROGRAM_FILE)
        this_path = abspath(dirname(PROGRAM_FILE))

        # check if path has not been found, this usually happens when the EXE program 
        # is included in the PATH env variable and the user executes the EXE program from a different folder
        if this_path == "" || this_path == "/"
            # TODO: do something
            printstyled("\n$PROGRAM_FILE is not complete enough - $this_path\n", color=:red)
        end
        # cd there otherwise it won't find the libraries
        cd(this_path)
    end
    
    if length(ARGS) > 0 && length(ARGS) < 15
        FollowerCount.get_multiple_followers(ARGS, true)
    else
        printstyled("\nNo arguments found\n\tUsage \n\t./InstagramScraper {instagram_profile_name1} {instagram_profile_name2} {instagram_profile_name3}\n", color=:light_yellow)
    end

    return 0
end

julia_main(ARGS)
precompile(julia_main, (Vector{String},))

end # module

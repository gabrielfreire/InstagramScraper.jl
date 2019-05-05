module InstagramScraper
include("utils.jl");
include("follower_count.jl")
using HTTP
using Gumbo

MbedTLS = HTTP.Servers.MbedTLS

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    if get(ENV, "COMPILING_APPLE_BUNDLE", "false") == "true"
        Core.eval(Gumbo, :(const libgumbo = "..\\\\lib\\\\$(basename(libgumbo))"))
        Core.eval(MbedTLS, :(const depsjl_path = ""))
        Core.eval(MbedTLS, :(cacert_path = "..\\\\res\\\\cacert.pem"))
        Core.eval(MbedTLS, :(const libmbedcrypto = "..\\\\lib\\\\$(basename(libmbedcrypto))"))
        Core.eval(MbedTLS, :(const libmbedtls = "..\\\\lib\\\\$(basename(libmbedtls))"))
        Core.eval(MbedTLS, :(const libmbedx509 = "..\\\\lib\\\\$(basename(libmbedx509))"))
    else
        # Check if it is my program and not PackageCompiler
        if occursin("InstagramScraper", PROGRAM_FILE)
            this_path = abspath(dirname(PROGRAM_FILE))
            # cd there otherwise it won't find the libraries
            cd(this_path)
        end
    end

    if length(ARGS) > 0 && length(ARGS) < 15
        get_multiple_followers(ARGS, true)
    else
        print("\nNo arguments found\n\tUsage \n\t./InstagramScraper {instagram_profile_name1} {instagram_profile_name2} {instagram_profile_name3}\n")
    end
    return 0
end

julia_main(ARGS)

end

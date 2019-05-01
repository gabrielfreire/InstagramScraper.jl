function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tuple{typeof(InstagramScraper.fetch_body), String})
    precompile(Tuple{typeof(InstagramScraper.get_followers), String})
    precompile(Tuple{typeof(InstagramScraper.include), String})
    precompile(Tuple{typeof(InstagramScraper.get_multiple_followers), Array{String, 1}, Bool})
    precompile(Tuple{typeof(InstagramScraper.julia_main), Array{String, 1}})
end

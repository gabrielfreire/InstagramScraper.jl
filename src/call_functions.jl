# This file is responsible for calling the main function for code_lowering before compilation
include("InstagramScraper.jl")
include("follower_count.jl")

get_followers("gabrielfreiredev")
get_multiple_followers(String["gabrielfreiredev"])
InstagramScraper.julia_main(String[])
InstagramScraper.julia_main(String["gabrielfreiredev", "freire.tatyana"])
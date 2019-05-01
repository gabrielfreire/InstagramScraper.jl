# This file is responsible for calling the main function for code_lowering before compilation
include("InstagramScraper.jl")

InstagramScraper.get_followers("gabrielfreiredev")
InstagramScraper.get_multiple_followers(String["gabrielfreiredev"])
InstagramScraper.julia_main(String[])
InstagramScraper.julia_main(String["gabrielfreiredev"])
InstagramScraper.julia_main(String["gabrielfreiredev", "freire.tatyana"])
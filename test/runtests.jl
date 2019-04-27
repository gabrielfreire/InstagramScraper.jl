using Test;
include("../src/InstagramScraper.jl")


@testset "Test main function" begin
    @test InstagramScraper.julia_main(String[]) == 0
end
@testset "get follower count" begin
    fc = InstagramScraper.get_followers("gabrielfreiredev")
    @test fc !== Nothing
    @test typeof(fc) == InstagramScraper.InstagramProfile
    @test_throws ErrorException InstagramScraper.get_followers("")
end

@testset "get multiple follower counts" begin
    two_arr = InstagramScraper.get_multiple_followers(String["gabrielfreiredev", "freire.tatyana"], true)
    one_arr = InstagramScraper.get_multiple_followers(String["gabrielfreiredev"], false)
    empty_arr = InstagramScraper.get_multiple_followers(String[], false)
    @test length(two_arr) == 2
    @test typeof(two_arr) == Array{InstagramScraper.InstagramProfile, 1}
    @test typeof(two_arr[1]) == InstagramScraper.InstagramProfile
    @test length(one_arr) == 1
    @test length(empty_arr) == 0
end

# runtests(tests=["all"], exit_on_error=false)
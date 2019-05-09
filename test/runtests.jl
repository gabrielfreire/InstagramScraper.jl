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
empty_arr = InstagramScraper.get_multiple_followers(String[], false)
one_arr = InstagramScraper.get_multiple_followers(String["gabrielfreiredev"], false)
two_arr = InstagramScraper.get_multiple_followers(String["gabrielfreiredev", "freire.tatyana"], true)
three_arr = InstagramScraper.get_multiple_followers(String["gabrielfreiredev", "freire.tatyana", "appexotic"], true)
    @test length(one_arr) == 1
    @test typeof(one_arr[1]) == InstagramScraper.InstagramProfile
    @test length(two_arr) == 2
    @test typeof(two_arr) == Array{InstagramScraper.InstagramProfile, 1}
    @test typeof(two_arr[1]) == InstagramScraper.InstagramProfile
    @test typeof(three_arr[3]) == InstagramScraper.InstagramProfile
    @test length(three_arr) == 3
    @test length(empty_arr) == 0
end

# runtests(tests=["all"], exit_on_error=false)
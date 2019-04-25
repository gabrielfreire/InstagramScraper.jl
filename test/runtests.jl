using Test;
include("../src/follower_count.jl");
include("../src/InstagramScraper.jl");

@testset "Test main function" begin
    @test InstagramScraper.julia_main(String[]) == 0
end
@testset "get follower count" begin
    fc = get_followers("gabrielfreiredev")
    @test fc !== Nothing
    @test typeof(fc) == InstagramProfile
    @test_throws ErrorException get_followers("")
end

@testset "get multiple follower counts" begin
    two_arr = get_multiple_followers(String["gabrielfreiredev", "freire.tatyana"], true)
    one_arr = get_multiple_followers(String["gabrielfreiredev"], false)
    empty_arr = get_multiple_followers(String[], false)
    @test length(two_arr) == 2
    @test typeof(two_arr) == Array{InstagramProfile, 1}
    @test typeof(two_arr[1]) == InstagramProfile
    @test length(one_arr) == 1
    @test length(empty_arr) == 0
end

# runtests(tests=["all"], exit_on_error=false)
using Test;
include("../src/InstagramScraper.jl")


@testset "Test main function" begin
    @test InstagramScraper.julia_main(String[]) == 0
end

@testset "get multiple follower counts" begin
empty_arr = InstagramScraper.FollowerCount.get_multiple_followers(String[], false)
one_arr = InstagramScraper.FollowerCount.get_multiple_followers(String["freire.tatyana"], false)
two_arr = InstagramScraper.FollowerCount.get_multiple_followers(String["appexotic", "freire.tatyana"], true)
three_arr = InstagramScraper.FollowerCount.get_multiple_followers(String["jairmessiasbolsonaro", "freire.tatyana", "appexotic"], true)
    @test length(one_arr) == 1
    @test typeof(one_arr[1]) == InstagramScraper.FollowerCount.InstagramProfile
    @test length(two_arr) == 2
    @test typeof(two_arr) == Vector{InstagramScraper.FollowerCount.InstagramProfile}
    @test typeof(two_arr[1]) == InstagramScraper.FollowerCount.InstagramProfile
    @test typeof(three_arr[3]) == InstagramScraper.FollowerCount.InstagramProfile
    @test length(three_arr) == 3
    @test length(empty_arr) == 0
end

# runtests(tests=["all"], exit_on_error=false)
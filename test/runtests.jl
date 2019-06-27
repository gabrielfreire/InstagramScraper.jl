using Test;
include("../src/InstagramScraper.jl")


@testset "Test main function" begin
    @test InstagramScraper.julia_main(String[]) == 0
end

@testset "get multiple follower counts" begin
empty = InstagramScraper.FollowerCount.get_multiple_followers(String[], false)
one = InstagramScraper.FollowerCount.get_multiple_followers(String["freire.tatyana"], false)
two = InstagramScraper.FollowerCount.get_multiple_followers(String["appexotic", "freire.tatyana"], true)
three = InstagramScraper.FollowerCount.get_multiple_followers(String["jairmessiasbolsonaro", "freire.tatyana", "appexotic"], true)
    @test length(one) == 1
    @test typeof(one[1]) == InstagramScraper.FollowerCount.InstagramProfile
    @test length(two) == 2
    @test typeof(two) == Vector{InstagramScraper.FollowerCount.InstagramProfile}
    @test typeof(two[1]) == InstagramScraper.FollowerCount.InstagramProfile
    @test typeof(three[3]) == InstagramScraper.FollowerCount.InstagramProfile
    @test length(three) == 3
    @test length(empty) == 0
end

# runtests(tests=["all"], exit_on_error=false)
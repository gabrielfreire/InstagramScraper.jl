# using PackageCompiler
# push!(LOAD_PATH, joinpath(abspath(@__DIR__), "../"))
# # # Build an executable from the Package
# # PackageCompiler.build_executable("src/InstagramScraper.jl", snoopfile="src/call_functions.jl", builddir="build/")

# PackageCompiler.compile_incremental(:InstagramScraper)

using ApplicationBuilder
using HTTP

app_path = joinpath(abspath(@__DIR__), "InstagramScraper.jl")

# include(joinpath(dirname(app_path), "call_functions.jl"))

build_app_bundle(app_path, 
                appname="InstagramScraper", 
                snoopfile="call_functions.jl", 
                verbose=true, 
                create_installer=true,
                binary_name="ig",
                commandline_app=true,
                libraries=[HTTP.Servers.MbedTLS.libmbedcrypto, HTTP.Servers.MbedTLS.libmbedtls, HTTP.Servers.MbedTLS.libmbedx509])
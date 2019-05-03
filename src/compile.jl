# using PackageCompiler
# push!(LOAD_PATH, joinpath(abspath(@__DIR__), "../"))
# # # Build an executable from the Package
# # PackageCompiler.build_executable("src/InstagramScraper.jl", snoopfile="src/call_functions.jl", builddir="build/")

# PackageCompiler.compile_incremental(:InstagramScraper)

using ApplicationBuilder
using HTTP

app_path = joinpath(abspath(@__DIR__), "InstagramScraper.jl")

mbedTLSPkg = dirname(dirname(pathof(HTTP.Servers.MbedTLS)))
# include(joinpath(dirname(app_path), "call_functions.jl"))

build_app_bundle(app_path,
                resources = [joinpath(mbedTLSPkg, "deps", "cacert.pem")],
                appname="InstagramScraper", 
                snoopfile="call_functions.jl", 
                verbose=true, 
                create_installer=true,
                binary_name="InstagramScraper",
                commandline_app=true,
                libraries=[HTTP.Servers.MbedTLS.libmbedcrypto, HTTP.Servers.MbedTLS.libmbedtls, HTTP.Servers.MbedTLS.libmbedx509])
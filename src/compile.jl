using ApplicationBuilder
using HTTP
using Cascadia:Gumbo

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
                libraries=[Gumbo.libgumbo, HTTP.Servers.MbedTLS.libmbedcrypto, HTTP.Servers.MbedTLS.libmbedtls, HTTP.Servers.MbedTLS.libmbedx509])
using ApplicationBuilder
using HTTP
using Cascadia:Gumbo

base_path = abspath(@__DIR__)
app_path = joinpath(base_path, "src", "InstagramScraper.jl")
snoop_path = joinpath(base_path, "src", "call_functions.jl")

res_path = joinpath(base_path, "res")
lib_path = joinpath(base_path, "lib")

mbedTLSPkg = dirname(dirname(pathof(HTTP.Servers.MbedTLS)))
# include(joinpath(dirname(app_path), "call_functions.jl"))

libs = [Gumbo.libgumbo, HTTP.Servers.MbedTLS.libmbedcrypto, HTTP.Servers.MbedTLS.libmbedtls, HTTP.Servers.MbedTLS.libmbedx509]

function clean_resources()
    printstyled("Cleaning resources.\n", color=:light_green)
    if isdir(res_path)
        rm(res_path, force=true, recursive=true)
    end
    if isdir(lib_path)
        rm(lib_path, force=true, recursive=true)
    end
end

function copy_resources()
    clean_resources()

    printstyled("Copying resources.\n", color=:light_green)
    if !isdir(res_path)
        mkdir(res_path)
    end
    if !isdir(lib_path)
        mkdir(lib_path)
    end
    cert_src = joinpath(mbedTLSPkg, "deps", "cacert.pem")
    cert_dest = joinpath(res_path, "cacert.pem")
    cp(cert_src, cert_dest)
    if length(libs) > 1
        for l in libs
            dest = joinpath(lib_path, basename(l))
            cp(l, dest)
        end
    end
end

function clean()
    printstyled("Cleaning everything.\n", color=:light_blue)
    builddir = joinpath(base_path, "builddir")
    insta_iss = joinpath(base_path, "InstagramScraper.iss")
    insta_exe = joinpath(base_path, "InstagramScraperSetup.exe")
    isdir(builddir) && rm(builddir, force=true, recursive=true)
    isfile(insta_iss) && rm(insta_iss, force=true)
    isfile(insta_exe) && rm(insta_exe, force=true)
end

clean() # initial clean
copy_resources() # copy necessary resources

ApplicationBuilder.build_app_bundle(app_path,
                                    resources = [
                                        joinpath(mbedTLSPkg, "deps", "cacert.pem")
                                    ],
                                    appname="InstagramScraper", 
                                    snoopfile=snoop_path, 
                                    verbose=true, 
                                    create_installer=true,
                                    binary_name="InstagramScraper",
                                    commandline_app=true,
                                    libraries=libs)
clean_resources() # remove copied resources
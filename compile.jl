using ApplicationBuilder
using HTTP
using Cascadia:Gumbo
using SnoopCompile

base_path = abspath(@__DIR__)
app_path = joinpath(base_path, "src", "InstagramScraper.jl")
snoop_path = joinpath(base_path, "src", "call_functions.jl")

res_path = joinpath(base_path, "res")
lib_path = joinpath(base_path, "lib")

mbedTLSPkg = dirname(dirname(pathof(HTTP.Servers.MbedTLS)))
# include(joinpath(dirname(app_path), "call_functions.jl"))

function make_snoop()
    printstyled("Checking for snoop files.\n", color=:light_green)
    precomp_path = joinpath(base_path, "src", "precompile")
    if !isdir(precomp_path)
        printstyled("Generating snoop files.\n", color=:light_green)
        
        SnoopCompile.@snoop "http_compiles.csv" begin
            using Pkg
            include("test/runtests.jl")
        end

        data = SnoopCompile.read("http_compiles.csv")

        pc = SnoopCompile.parcel(reverse!(data[2]))
        SnoopCompile.write(precomp_path, pc)
        rm("http_compiles.csv")
    end
    printstyled("Done.\n", color=:light_green)
end

function clean_resources()
    printstyled("Cleaning resources.\n", color=:light_green)
    if isdir(res_path)
        rm(res_path, force=true, recursive=true)
    end
    if isdir(lib_path)
        rm(lib_path, force=true, recursive=true)
    end
    printstyled("Done.\n", color=:light_green)
end

function copy_resources(libraries::Vector{String}, resources::Vector{String})
    clean_resources()

    printstyled("Copying resources.\n", color=:light_green)
    if !isdir(res_path)
        mkdir(res_path)
    end
    if !isdir(lib_path)
        mkdir(lib_path)
    end

    # copy resources
    for res in resources
        dest = joinpath(res_path, basename(res))
        cp(res, dest)
    end

    # copy libraries
    for lib in libraries
        dest = joinpath(lib_path, basename(lib))
        cp(lib, dest)
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


#=
    COMPILE
=#

libs = [
    Gumbo.libgumbo, 
    HTTP.Servers.MbedTLS.libmbedcrypto, 
    HTTP.Servers.MbedTLS.libmbedtls, 
    HTTP.Servers.MbedTLS.libmbedx509
]

resources = [
    joinpath(mbedTLSPkg, "deps", "cacert.pem")
]

clean() # initial clean
copy_resources(libs, resources) # copy necessary resources and libraries
make_snoop() # make all snoop files

ApplicationBuilder.build_app_bundle(app_path,
                                    appname="InstagramScraper", 
                                    snoopfile=snoop_path, 
                                    verbose=true, 
                                    create_installer=true,
                                    binary_name="InstagramScraper",
                                    commandline_app=true,
                                    resources = resources,
                                    libraries = libs)

clean_resources() # remove copied resources
module ResourceRep
using HTTP
MbedTLS = HTTP.Servers.MbedTLS
using Cascadia:Gumbo
export make_replacement

function make_replacement(startpath::Bool)
    # Overwrite lib constants for compilation
    if get(ENV, "COMPILING_APPLE_BUNDLE", "false") == "true"
        if startpath
            Core.eval(Gumbo, :(const libgumbo = "lib\\\\$(basename(libgumbo))"))
            Core.eval(MbedTLS, :(crt_parse_file(path) = crt_parse(String(read("res\\\\cacert.pem")))))
            Core.eval(MbedTLS, :(const depsjl_path = ""))
            Core.eval(MbedTLS, :(const libmbedcrypto = "lib\\\\$(basename(libmbedcrypto))"))
            Core.eval(MbedTLS, :(const libmbedtls = "lib\\\\$(basename(libmbedtls))"))
            Core.eval(MbedTLS, :(const libmbedx509 = "lib\\\\$(basename(libmbedx509))"))
        else
            Core.eval(Gumbo, :(const libgumbo = "..\\\\lib\\\\$(basename(libgumbo))"))
            Core.eval(MbedTLS, :(crt_parse_file(path) = crt_parse(String(read("..\\\\res\\\\cacert.pem")))))
            Core.eval(MbedTLS, :(const depsjl_path = ""))
            Core.eval(MbedTLS, :(const libmbedcrypto = "..\\\\lib\\\\$(basename(libmbedcrypto))"))
            Core.eval(MbedTLS, :(const libmbedtls = "..\\\\lib\\\\$(basename(libmbedtls))"))
            Core.eval(MbedTLS, :(const libmbedx509 = "..\\\\lib\\\\$(basename(libmbedx509))"))

        end
        println(relpath(@__FILE__))
        # Core.eval(Gumbo, :(const libgumbo = "lib\\\\$(basename(libgumbo))"))
        # Core.eval(MbedTLS, :(crt_parse_file(path) = crt_parse(String(read("res\\\\cacert.pem")))))
        # Core.eval(MbedTLS, :(const depsjl_path = ""))
        # Core.eval(MbedTLS, :(const libmbedcrypto = "lib\\\\$(basename(libmbedcrypto))"))
        # Core.eval(MbedTLS, :(const libmbedtls = "lib\\\\$(basename(libmbedtls))"))
        # Core.eval(MbedTLS, :(const libmbedx509 = "lib\\\\$(basename(libmbedx509))"))
    end
end
end
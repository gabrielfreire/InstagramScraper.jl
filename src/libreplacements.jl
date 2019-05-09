
# Overwrite lib constants for compilation
if get(ENV, "COMPILING_APPLE_BUNDLE", "false") == "true"
    using HTTP
    MbedTLS = HTTP.Servers.MbedTLS
    using Cascadia:Gumbo
    Core.eval(Gumbo, :(const libgumbo = "..\\\\lib\\\\$(basename(libgumbo))"))
    Core.eval(MbedTLS, :(crt_parse_file(path) = crt_parse(String(read("..\\\\res\\\\cacert.pem")))))
    Core.eval(MbedTLS, :(const depsjl_path = ""))
    Core.eval(MbedTLS, :(const libmbedcrypto = "..\\\\lib\\\\$(basename(libmbedcrypto))"))
    Core.eval(MbedTLS, :(const libmbedtls = "..\\\\lib\\\\$(basename(libmbedtls))"))
    Core.eval(MbedTLS, :(const libmbedx509 = "..\\\\lib\\\\$(basename(libmbedx509))"))
end
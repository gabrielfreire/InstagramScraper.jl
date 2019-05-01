function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tuple{typeof(Sockets.connect), Sockets.IPv4, UInt64})
end

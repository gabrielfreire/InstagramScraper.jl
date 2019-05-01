function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tuple{getfield(Logging, Symbol("##handle_message#2")), Nothing, (Base.Iterators).Pairs{Union{}, Union{}, Tuple{}, NamedTuple{(), Tuple{}}}, typeof(identity), Logging.ConsoleLogger, (Base.CoreLogging).LogLevel, String, Module, String, Symbol, String, Int64})
    precompile(Tuple{typeof(Logging.default_metafmt), Base.CoreLogging.LogLevel, Module, String, Symbol, String, Int64})
end

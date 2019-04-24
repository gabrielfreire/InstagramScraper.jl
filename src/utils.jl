"""
    @jit ...
The `@jit` annotation can be applied to any code, and the code will be compiled
for performance.
    @jit f(x) = @jit(x) + @jit(x)
Note that compilation happens regardless of the `@jit` macro, so it should only
be used for aesthetic purposes, or by recovering Python users.
"""
macro jit(ex)
    esc(ex)
end
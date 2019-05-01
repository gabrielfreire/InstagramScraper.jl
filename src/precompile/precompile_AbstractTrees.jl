function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tuple{typeof(AbstractTrees.update_state!), Gumbo.HTMLElement{:HTML}, AbstractTrees.ImplicitNodeStack{Any, Int64}, Array{Gumbo.HTMLNode, 1}, Int64})
    precompile(Tuple{typeof(AbstractTrees.getnode), Gumbo.HTMLElement{:HTML}, AbstractTrees.ImplicitNodeStack{Any, Int64}})
    precompile(Tuple{typeof(AbstractTrees.childstates), AbstractTrees.ImplicitChildStates{Gumbo.HTMLElement{:HTML}, AbstractTrees.ImplicitNodeStack{Any, Int64}}})
    precompile(Tuple{typeof(AbstractTrees.get_primary), DataType})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:head}})
    precompile(Tuple{typeof(AbstractTrees.childstates), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:span}})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:span}})
    precompile(Tuple{typeof(AbstractTrees.childstates), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:script}})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:script}})
    precompile(Tuple{typeof(AbstractTrees.childstates), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:head}})
    precompile(Tuple{typeof(AbstractTrees.childstates), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:body}})
    precompile(Tuple{typeof(AbstractTrees.childstates), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:path}})
    precompile(Tuple{typeof(AbstractTrees.childstates), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:svg}})
    precompile(Tuple{typeof(AbstractTrees.childstates), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:title}})
    precompile(Tuple{typeof(AbstractTrees.childstates), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:link}})
    precompile(Tuple{typeof(AbstractTrees.childstates), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:meta}})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:body}})
    precompile(Tuple{typeof(AbstractTrees.joinstate), Gumbo.HTMLElement{:HTML}, AbstractTrees.ImplicitNodeStack{Any, Int64}, AbstractTrees.ImplicitNodeStack{Any, Int64}})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:svg}})
    precompile(Tuple{typeof(AbstractTrees.stepstate), AbstractTrees.PreOrderDFS{Gumbo.HTMLElement{:HTML}}, AbstractTrees.ImplicitNodeStack{Any, Int64}})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:HTML}, Gumbo.HTMLElement{:HTML}})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:body}})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:HTML}, AbstractTrees.ImplicitNodeStack{Any, Int64}})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:head}})
    precompile(Tuple{typeof(AbstractTrees.children), Gumbo.HTMLElement{:title}})
    precompile(Tuple{typeof(AbstractTrees.update_state!), Gumbo.HTMLElement{:HTML}, AbstractTrees.ImplicitNodeStack{Any, Int64}, Array{Gumbo.HTMLNode, 1}, Int64, AbstractTrees.RegularTree})
    precompile(Tuple{typeof(AbstractTrees.parentstate), Gumbo.HTMLElement{:HTML}, AbstractTrees.ImplicitNodeStack{Any, Int64}})
    precompile(Tuple{typeof(AbstractTrees.parentstate), Gumbo.HTMLElement{:HTML}, AbstractTrees.ImplicitIndexStack{Int64}})
    precompile(Tuple{typeof(AbstractTrees.nextsibling), Gumbo.HTMLElement{:HTML}, AbstractTrees.ImplicitNodeStack{Any, Int64}})
end

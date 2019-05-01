function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    precompile(Tuple{typeof(Cascadia.parseInteger), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.parseEscape), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.parseString), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.skipWhitespace), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.consumeParenthesis), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.attributeSelector), getfield(Cascadia, Symbol("##9#10")), String})
    precompile(Tuple{typeof(Cascadia.parsePseudoclassSelector), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.parseRegex), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.parseNth), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.nameStart), Char})
    precompile(Tuple{typeof(Cascadia.nameChar), Char})
    precompile(Tuple{typeof(Cascadia.parseSelector), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.attributeSelector), getfield(Cascadia, Symbol("##15#16")){String}, String})
    precompile(Tuple{typeof(Cascadia.parseAttributeSelector), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.attributeSelector), getfield(Cascadia, Symbol("##21#22")){String}, String})
    precompile(Tuple{typeof(Cascadia.consumeClosingParenthesis), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.parseError), Cascadia.Parser, String})
    precompile(Tuple{typeof(Cascadia.matchAllInto), Cascadia.Selector, Gumbo.HTMLElement{:HTML}, Array{Gumbo.HTMLNode, 1}})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:path}})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:svg}})
    precompile(Tuple{typeof(Cascadia.attributeSelector), getfield(Cascadia, Symbol("##13#14")){String}, String})
    precompile(Tuple{typeof(Cascadia.attributeSelector), getfield(Cascadia, Symbol("##23#24")){String, Base.Regex}, String})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:HTML}})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:body}})
    precompile(Tuple{typeof(Cascadia.attributeSelector), getfield(Cascadia, Symbol("##17#18")){String}, String})
    precompile(Tuple{typeof(Cascadia.typeSelector), String})
    precompile(Tuple{typeof(Cascadia.parseName), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.parseSelectorGroup), Cascadia.Parser})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:script}})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:span}})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:meta}})
    precompile(Tuple{typeof(Cascadia.attributeSelector), getfield(Cascadia, Symbol("##11#12")){String}, String})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:title}})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:head}})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLElement{:link}})
    precompile(Tuple{typeof(Cascadia.attributeSelector), getfield(Cascadia, Symbol("##19#20")){String}, String})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:head}})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:svg}})
    precompile(Tuple{typeof(Cascadia.parseIdentifier), Cascadia.Parser})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:span}})
    precompile(Tuple{getfield(Cascadia, Symbol("##5#6")), Gumbo.HTMLText})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:path}})
    precompile(Tuple{typeof(Cascadia.parseSimpleSelectorSequence), Cascadia.Parser})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:script}})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLText})
    precompile(Tuple{getfield(Cascadia, Symbol("#@sel_str")), LineNumberNode, Module, AbstractString})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:HTML}})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:meta}})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:title}})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:body}})
    precompile(Tuple{Cascadia.Selector, Gumbo.HTMLElement{:link}})
    precompile(Tuple{typeof(Cascadia.parseIDSelector), Cascadia.Parser})
    precompile(Tuple{typeof(Cascadia.parseClassSelector), Cascadia.Parser})
end

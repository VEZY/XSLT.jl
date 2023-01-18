using XSLT
using Documenter

DocMeta.setdocmeta!(XSLT, :DocTestSetup, :(using XSLT); recursive=true)

makedocs(;
    modules=[XSLT],
    authors="Rémi Vezy <VEZY@users.noreply.github.com> and contributors",
    repo="https://github.com/VEZY/XSLT.jl/blob/{commit}{path}#{line}",
    sitename="XSLT.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://VEZY.github.io/XSLT.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "API" => "api.md",
    ], 
)

deploydocs(;
    repo="github.com/VEZY/XSLT.jl",
    devbranch="main",
)

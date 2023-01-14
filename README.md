# XSLT

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://VEZY.github.io/XSLT.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://VEZY.github.io/XSLT.jl/dev/)
[![Build Status](https://github.com/VEZY/XSLT.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/VEZY/XSLT.jl/actions/workflows/CI.yml?query=branch%3Amain)

Julia wrapper for the [libxslt](http://xmlsoft.org/libxslt/) library. It allows to transform XML documents to any other document using XSLT stylesheets.

XSLT is fully compatible with [EzXML.jl](https://github.com/JuliaIO/EzXML.jl) and [LightXML.JL](https://github.com/JuliaIO/LightXML.jl), so you can use it to transform XML documents to HTML, JSON, etc...

## Installation

The package can be installed with the Julia package manager. From the Julia REPL, type `]` to enter the Pkg REPL mode and run:

```julia
pkg> add XSLT
```

Or, equivalently, via the `Pkg` API:

```julia
julia> import Pkg; Pkg.add("XSLT")
```

## Example usage: transform XML to HTML

### Using file paths

```julia
julia> using XSLT

julia> xml_file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xml")
julia> xslt_file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xsl")

julia> xml_xslt(xml_file, xslt_file)
"<html><body>\n<h2>My CD Collection</h2>\n<table border=\"1\">\n<tr bgcolor=\"#9acd32\">\n<th>Title</th>\n<th>Artist</th>\n</tr>\n<tr>\n<td>Empire Burlesque</td>\n<td>Bob Dylan</td>\n</tr>\n<tr>\n<td>Still got the blues</td>\n<td>Gary Moore</td>\n</tr>\n<tr>\n<td>One night only</td>\n<td>Bee Gees</td>\n</tr>\n<tr>\n<td>Romanza</td>\n<td>Andrea Bocelli</td>\n</tr>\n<tr>\n<td>Black angel</td>\n<td>Savage Rose</td>\n</tr>\n<tr>\n<td>1999 Grammy Nominees</td>\n<td>Many</td>\n</tr>\n</table>\n</body></html>\n"
```

### Using EzXML

```julia
julia> using XSLT, EzXML

julia> xml = readxml(xml_file)

julia> xml_xslt(xml, xslt_file) |> parsehtml
```

### Using LigthXML


```julia
julia> using XSLT, LigthXML

julia> xml = parse_file(xml_file)

julia> xml_xslt(xml, xslt_file)
```

We can also import the xslt file and use it directly:

```julia
julia> using XSLT

julia> xslt_file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xsl")

julia> xslt = read_stylesheet(xslt_file)

julia> xml_xslt(xml_file, xslt)
```

## Similar projects

- [libxslt](http://xmlsoft.org/libxslt/) - the C library used by this package
- [xslt R package](https://github.com/ropensci/xslt), from the [rOpenSci](https://ropensci.org/) organization, from which the API name is inspired
- The different official bindings in other languages:
  - [Python](http://xmlsoft.org/xslt/python.html)
  - [Pascal](https://sourceforge.net/projects/libxml2-pas/)
  - And others (broken links...)



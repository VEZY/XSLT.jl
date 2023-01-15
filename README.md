# XSLT

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://VEZY.github.io/XSLT.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://VEZY.github.io/XSLT.jl/dev/)
[![Build Status](https://github.com/VEZY/XSLT.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/VEZY/XSLT.jl/actions/workflows/CI.yml?query=branch%3Amain)

Transform XML documents to any other document type using XSLT stylesheets.

This is a Julia wrapper for the [libxslt](http://xmlsoft.org/libxslt/) library. 

XSLT.jl is fully compatible with [EzXML.jl](https://github.com/JuliaIO/EzXML.jl) and [LightXML.jl](https://github.com/JuliaIO/LightXML.jl), so you can use it to transform XML documents to HTML, JSON, etc...

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

### Using file paths directly (no further dependency)

```julia
julia> using XSLT

julia> xml_file = joinpath(dirname(pathof(XSLT)), "..", "test", "files", "cd_catalog.xml")
julia> xslt_file = joinpath(dirname(pathof(XSLT)), "..", "test", "files", "cd_catalog.xsl")

julia> xml_xslt(xml_file, xslt_file)
```

### Using document pointers (no further dependency either)

```julia
julia> using XSLT

julia> xml = read_xml(joinpath(dirname(pathof(XSLT)), "..", "test", "files", "cd_catalog.xml"))
julia> xslt = read_xslt(joinpath(dirname(pathof(XSLT)), "..", "test", "files", "cd_catalog.xsl"))

julia> xml_xslt(xml, xslt)
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



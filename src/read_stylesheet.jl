"""
    read_stylesheet(filename::String)

Read the stylesheet `filename` and return a `xsltPtr` (equivalent to `xsltStylesheetPtr`).
The stylesheet can then be applied to an XML document using [`xml_xslt`](@ref).

# Example

```julia
using XSLT

# Get the stylesheet from the test files in the package:
file = joinpath(dirname(pathof(XSLT)), "..", "test", "files", "cd_catalog.xsl")

# Read the stylesheet:
xslt = read_stylesheet(file)
```
"""
read_stylesheet(filename::S) where {S<:String} = xsltParseStylesheetFile(filename)
"""
    xml_xslt(x, xslt, params= nothing)

Apply the stylesheet `xslt` to the XML `x` with the given `params`.

# Arguments

- `x`: can be a file path, a pointer returned by [`read_xml`](@ref), an EzXML.jl `Document`
or a LightXML.jl `XMLDocument`.
- `xslt`: can be a file path or an `xsltPtr` (output of [`read_stylesheet`](@ref)).
- `params`: a dictionnary, tuple or Vector{Pair} of key-values for parameters. Can also be 
directy a vector of strings of the form `["param1", "\"stringvalue1\"", "param2", "1"]`.

Returns the result as a string.

# Example

```julia
using EzXML
using XSLT

# Get the path to the test files in the package:
test_dir = joinpath(dirname(pathof(XSLT)), "..", "test", "files")

xml = readxml(joinpath(test_dir, "cd_catalog.xml"))
xslt = joinpath(test_dir, "cd_catalog.xsl")

res = xml_xslt(xml, xslt)

write("cd_catalog.html", res)
```
"""
function xml_xslt(x, xslt, params=nothing)
    # x can be a file path or an EzXML.jl Document or a LightXML.jl XMLDocument
    # In the latter two cases, we need to get the pointer to the xmlDocPtr
    doc_xslt_apply(get_x(x), xslt, parse_parameters(params))
end

"""
    get_x(x)

Return `x` if it is a file path or a pointer (`Ptr`), or get the pointer to the xmlDocPtr
from `x` if `x` is an EzXML.jl `Document` or a LightXML.jl `XMLDocument`.
"""
function get_x(x::S) where {S<:AbstractString}
    return x
end

function get_x(x::P) where {P<:Ptr}
    return x
end

function get_x(x)
    # EzXML puts the pointer in doc.node.ptr, LightXML puts it in doc.ptr
    xmlDocPtr = hasproperty(x, :node) ? x.node.ptr : xmlDocPtr = x.ptr
    @assert isa(xmlDocPtr, Ptr) "`x` must be an EzXML.jl Document or a LightXML.jl XMLDocument"

    return xmlDocPtr
end

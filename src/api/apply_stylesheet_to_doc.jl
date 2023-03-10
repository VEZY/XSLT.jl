"""
    doc_xslt_apply(doc, xslt, params)

Apply the stylesheet `xslt` to the XML `doc` with the given `params`.

# Arguments

- `doc`: can be a file path or an EzXML.jl `Document` or a LightXML.jl `XMLDocument`.
- `xslt`: can be a file path or an `xsltPtr` (output of [`read_stylesheet`](@ref)).
- `params`: a vector of strings with key-values for parameters, e.g. `["param_name=param_value", "param_name2=param_value2"]`.

# Example

```julia
using EzXML

# Get the path to the test files in the package:
test_dir = joinpath(dirname(pathof(XSLT)), "..", "test", "files")

xml = readxml(joinpath(test_dir, "cd_catalog.xml"))
xslt = joinpath(test_dir, "cd_catalog.xsl")

res = doc_xslt_apply(xml, xslt)

write("cd_catalog.html", res)
```
"""
function doc_xslt_apply(file::S, xslt, params) where {S<:AbstractString}
    xmlDocPtr = xmlReadFile(file)
    str = doc_xslt_apply(xmlDocPtr, xslt, params)
    return str
end

function doc_xslt_apply(xmlDocPtr::P, xslt, params) where {P<:Ptr}
    xslt = normpath(xslt)
    @assert isfile(xslt) "File `xslt` doesn't exist or is not an XSL or XSLT stylesheet"
    xsltStylesheetPtr = xsltParseStylesheetFile(xslt)
    str = doc_xslt_apply(xmlDocPtr, xsltStylesheetPtr, params)

    return str
end


function doc_xslt_apply(xmlDocPtr::P1, xsltStylesheetPtr::P2, params) where {P1<:Ptr{T1} where {T1},P2<:Ptr{T2} where {T2}}

    # Applying the stylesheet:
    res = xsltApplyStylesheet(xsltStylesheetPtr, xmlDocPtr, params)

    # Getting the result as a Ref{String}:
    str, len = xsltSaveResultToString(res, xsltStylesheetPtr)

    # Converting the result to a string:
    str = unsafe_string(str[])

    # Freeing memory allocation:
    xsltFreeStylesheet(xsltStylesheetPtr)
    xmlFreeDoc(res)
    xsltCleanupGlobals()
    xmlCleanupParser()

    return str
end
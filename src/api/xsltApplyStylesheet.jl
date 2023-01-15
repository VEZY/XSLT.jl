"""
    xsltApplyStylesheet(xslt::Xptr, doc::Xptr, params<:AbstractString)

Apply the stylesheet `xslt` to the document `doc` with the given `params`.
"""
function xsltApplyStylesheet(xslt::Xptr, doc, params)
    # returns an xmlDocPtr
    ccall((:xsltApplyStylesheet, libxslt), Xptr, (Xptr, Xptr, Ptr{Ptr{Cchar}}), xslt, doc, params)
end
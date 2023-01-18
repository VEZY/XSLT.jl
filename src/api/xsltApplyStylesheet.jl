"""
    xsltApplyStylesheet(xslt::Xptr, doc::Xptr, params<:AbstractString)

Apply the stylesheet `xslt` to the document `doc` with the given `params`.
"""
function xsltApplyStylesheet(xslt::Xptr, doc, params)
    # returns an xmlDocPtr
    @check ccall((:xsltApplyStylesheet, libxslt), Xptr, (Xptr, Xptr, Ptr{Ptr{Cchar}}), xslt, doc, params) != C_NULL
end
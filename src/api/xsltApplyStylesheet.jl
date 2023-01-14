"""
    xsltApplyStylesheet(xslt::Xptr, doc::Xptr, params::Vector{String})

Apply the stylesheet `xslt` to the document `doc` with the given `params`.
"""
function xsltApplyStylesheet(xslt::Xptr, doc, params::Vector{String})
    # returns an xmlDocPtr
    ccall((:xsltApplyStylesheet, libxslt), Xptr, (Xptr, Xptr, Ref{Cstring}), xslt, doc, params)
end
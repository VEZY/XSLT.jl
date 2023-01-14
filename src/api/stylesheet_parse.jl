"""
    xsltParseStylesheetFile(filename::String)

Parse an XSLT file into a stylesheet.
"""
function xsltParseStylesheetFile(filename::S) where {S<:String}
    # returns an xsltStylesheetPtr
    ccall((:xsltParseStylesheetFile, libxslt), Xptr, (Cstring,), filename)
end

"""
    xsltFreeStylesheet(cur::Xptr)

Free the memory allocated to the stylesheet `cur`.
"""
function xsltFreeStylesheet(cur::Xptr)
    ccall((:xsltFreeStylesheet, libxslt), Cvoid, (Xptr,), cur)
end
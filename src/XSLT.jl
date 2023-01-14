module XSLT

using XSLT_jll



struct xmlBuffer end
const Xptr = Ptr{xmlBuffer}

const Xchar = UInt8
const Xstr = Ptr{Xchar}

"""
    xsltParseStylesheetFile(filename::String)

Parse an XSLT file into a stylesheet.
"""
function xsltParseStylesheetFile(filename::String)
    # returns an xsltStylesheetPtr
    ccall((:xsltParseStylesheetFile, libxslt), Xptr, (Xstr,), filename)
end

"""
    xmlParseFile(filename::String)

Parse an XML file into a document.
"""
# xmlParseFile takes a string as input and returns a pointer to a document
function xmlParseFile(filename::String)
    # returns an xmlDocPtr
    ccall((:xmlParseFile, libxslt), Xptr, (Cstring,), filename)
end

"""
    xsltApplyStylesheet(xslt::Xptr, doc::Xptr, params::Vector{String})

Apply the stylesheet `xslt` to the document `doc` with the given `params`.
"""
function xsltApplyStylesheet(xslt::Xptr, doc::Xptr, params::Vector{String})
    # returns an xmlDocPtr
    ccall((:xsltApplyStylesheet, libxslt), Xptr, (Xptr, Xptr, Ptr{Cstring}), xslt, doc, params)
end

"""
    xsltSaveResultToString(str::Ref{Cstring}, len::Ref{Cint}, xml::Xptr, xslt::Xptr)

Return the result transformed XML file (`xml`) to a string considering an xslt transformation. 
The `xslt` is given so that output-related information contained in the stylesheet, such as the encoding
to be used, is used in output.

The `str` and `len` are used to return the string and its length.

See tutorial here: https://gnome.pages.gitlab.gnome.org/libxslt/tutorial2/libxslt_pipes.html
"""
function xsltSaveResultToString(str::Ref{Cstring}, len::Ref{Cint}, xml::Xptr, xslt::Xptr)
    ccall((:xsltSaveResultToString, libxslt), Cstring, (Ref{Cstring}, Ref{Cint}, Xptr, Xptr), str, len, xml, xslt)
end


function doc_xslt_apply(file, xslt, params::Vector{String})
    xsltStylesheetPtr = xsltParseStylesheetFile(xslt)
    xmlDocPtr = xmlParseFile(file)
    res = xsltApplyStylesheet(xsltStylesheetPtr, xmlDocPtr, params)

    str = Ref{Cstring}()
    len = Ref{Cint}()
    xsltSaveResultToString(str, len, res, xsltStylesheetPtr)
    _xcopystr(str)
end


export xmlParseFile, xsltParseStylesheetFile, doc_xslt_apply
end

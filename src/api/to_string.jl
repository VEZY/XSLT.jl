"""
    xsltSaveResultToString(xml::Xptr, xslt::Xptr)

Return the transformed XML file (`xml`) to a string considering an xslt transformation. 
The `xslt` is given so that output-related information contained in the stylesheet, such as the encoding
to be used, is used in output.

See doc and tutorial here: https://gnome.pages.gitlab.gnome.org/libxslt/tutorial2/libxslt_pipes.html

Returns a tuple of two: the output string and its length.
"""
function xsltSaveResultToString(xml::Xptr, xslt::Xptr)
    str = Ref{Cstring}()
    len = Ref{Cint}()

    ccall((:xsltSaveResultToString, libxslt), Cstring, (Ref{Cstring}, Ref{Cint}, Xptr, Xptr), str, len, xml, xslt)

    return str, len
end
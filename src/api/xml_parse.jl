"""
    xmlParseFile(filename::String)

Parse an XML file into a document.
"""
function xmlParseFile(filename::String)
    # xmlParseFile takes a string as input and returns a pointer to a document (an xmlDocPtr)
    ccall((:xmlParseFile, libxslt), Xptr, (Cstring,), filename)
end


"""
    xmlFreeDoc(res::Xptr)

Free the memory allocated to the document `res`.
"""
function xmlFreeDoc(res::Xptr)
    ccall((:xmlFreeDoc, libxslt), Cvoid, (Xptr,), res)
end



"""
    xmlParseFile(filename::String)

Parse an XML file into a document.
"""
function xmlParseFile(filename::String)
    # xmlParseFile takes a string as input and returns a pointer to a document (an xmlDocPtr)
    @check ccall((:xmlParseFile, libxml2), Xptr, (Cstring,), filename) != C_NULL
end

"""
    xmlReadFile(filename::String; encoding="UTF-8", options=0)

Read an XML file into a document.
"""
function xmlReadFile(filename::String; encoding="UTF-8", options=0)
    # xmlParseFile takes a string as input and returns a pointer to a document (an xmlDocPtr)
    @check ccall((:xmlReadFile, libxml2), Xptr, (Cstring, Cstring, Cint), filename, encoding, options) != C_NULL
end


"""
    xmlFreeDoc(res::Xptr)

Free the memory allocated to the document `res`.
"""
function xmlFreeDoc(res::Xptr)
    ccall((:xmlFreeDoc, libxml2), Cvoid, (Xptr,), res)
end

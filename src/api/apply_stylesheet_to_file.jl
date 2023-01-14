"""
    file_xslt_apply(file, xslt, params::Vector{String})

Apply the stylesheet `xslt` to the XML `file` with the given `params`.
"""
function file_xslt_apply(file, xslt, params::Vector{String})
    xsltStylesheetPtr = xsltParseStylesheetFile(xslt)
    xmlDocPtr = xmlParseFile(file)
    res = xsltApplyStylesheet(xsltStylesheetPtr, xmlDocPtr, params)

    str, len = xsltSaveResultToString(res, xsltStylesheetPtr)

    str = unsafe_string(str[])

    # Freeing memory allocation:
    xsltFreeStylesheet(xsltStylesheetPtr)
    xmlFreeDoc(xmlDocPtr)
    xmlFreeDoc(res)
    xsltCleanupGlobals()
    xmlCleanupParser()

    return str
end
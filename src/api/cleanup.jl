function xsltCleanupGlobals()
    ccall((:xsltCleanupGlobals, libxslt), Cvoid, ())
end

function xmlCleanupParser()
    ccall((:xmlCleanupParser, libxslt), Cvoid, ())
end
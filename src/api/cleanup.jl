function xsltCleanupGlobals()
    ccall((:xsltCleanupGlobals, libxslt), Cvoid, ())
end

function xmlCleanupParser()
    ccall((:xmlCleanupParser, libxml2), Cvoid, ())
end

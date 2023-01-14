using XSLT
using Test

# Test files are from https://www.w3schools.com/xml, e.g.: https://www.w3schools.com/xml/cd_catalog.xml

@testset "XSLT.jl" begin

    file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xml")
    xslt = joinpath(dirname(@__FILE__), "files", "cd_catalog.xsl")

    xsltParseStylesheetFile(xslt)
    xmlParseFile(file)

    doc_xslt_apply(file, xslt, String[])
end

Ref(file)

mktemp() do f, io
    write(io, "test")
    close(io)
    println(f)
    println(io)
end

touch("tmp.txt")
io = open("tmp.txt")
io
close(io)
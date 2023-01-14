using XSLT
using Test

# Test files are from https://www.w3schools.com/xml, e.g.: https://www.w3schools.com/xml/cd_catalog.xml

@testset "XSLT.jl" begin

    file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xml")
    xslt = joinpath(dirname(@__FILE__), "files", "cd_catalog.xsl")

    test = xsltParseStylesheetFile(xslt)


    @test isassigned(test)
    xmlParseFile(file)

    doc_xslt_apply(file, xslt, String[])
end

test = Ref(file)
isassigned(test)
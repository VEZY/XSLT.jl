xml_file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xml")
xslt_file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xsl")

@testset "error test: xml file" begin
    Test.@test_throws "unknown error of libxml2 or libxslt" XSLT.read_xml("nonsense.xml")
    Test.@test_throws "AssertionError: `x` must be an XML document file path" XSLT.xml_xslt("nonsense.xml", "anotheone.xsl")
end

@testset "error test: xslt file" begin
    Test.@test_throws "unknown error of libxml2 or libxslt" XSLT.read_stylesheet("nonsense.xml")
    Test.@test_throws "AssertionError: File `xslt` doesn't exist or is not an XSL or XSLT stylesheet" XSLT.xml_xslt(xml_file, "nonsense.xml")
end
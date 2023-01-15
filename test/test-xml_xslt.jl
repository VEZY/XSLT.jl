function test_html_equality(a, b)
    root_xml = a.root
    root_ref = b.root

    @test root_xml.name == root_ref.name
    @test replace(root_xml.content, r"\s+" => "") == replace(root_ref.content, r"\s+" => "")
end

xml_file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xml")
xslt_file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xsl")
ref_html = readhtml(joinpath(dirname(@__FILE__), "files", "cd_catalog.html"))

@testset "read_xml" begin
    p = XSLT.read_xml(xml_file)
    @test p != C_NULL
    @test isa(p, Ptr)
end

@testset "read_stylesheet" begin
    p = XSLT.read_stylesheet(xslt_file)
    @test p != C_NULL
    @test isa(p, Ptr)
end

@testset "Files inputs" begin
    html_from_xml = xml_xslt(xml_file, xslt_file) |> parsehtml
    test_html_equality(html_from_xml, ref_html)
end

@testset "XML File + stylesheet Ptr" begin
    xslt = XSLT.read_stylesheet(xslt_file)
    html_from_xml = xml_xslt(xml_file, xslt) |> parsehtml
    test_html_equality(html_from_xml, ref_html)
end

@testset "XML Ptr + stylesheet Ptr" begin
    xslt = XSLT.read_stylesheet(xslt_file)
    xml = XSLT.read_xml(xml_file)
    html_from_xml = xml_xslt(xml, xslt) |> parsehtml
    test_html_equality(html_from_xml, ref_html)
end

@testset "EzXML + stylesheet Ptr" begin
    xml = EzXML.readxml(xml_file)
    xslt = XSLT.read_stylesheet(xslt_file)

    html_from_xml = xml_xslt(xml, xslt) |> parsehtml
    test_html_equality(html_from_xml, ref_html)
end


@testset "LightXML + stylesheet Ptr" begin
    xml = LightXML.parse_file(xml_file)
    xslt = XSLT.read_stylesheet(xslt_file)

    html_from_xml = xml_xslt(xml, xslt) |> parsehtml
    test_html_equality(html_from_xml, ref_html)
end

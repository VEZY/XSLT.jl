using XSLT
using Test
using EzXML

# Test files are from https://www.w3schools.com/xml, e.g.: https://www.w3schools.com/xml/cd_catalog.xml

@testset "XSLT.jl" begin

    file = joinpath(dirname(@__FILE__), "files", "cd_catalog.xml")
    xslt = joinpath(dirname(@__FILE__), "files", "cd_catalog.xsl")

    html_from_xml = file_xslt_apply(file, xslt, String[]) |> parsehtml
    ref_html = readhtml(joinpath(dirname(@__FILE__), "files", "cd_catalog.html"))

    root_xml = html_from_xml.root
    root_ref = ref_html.root

    @test root_xml.name == root_ref.name
    @test replace(root_xml.content, r"\s+" => "") == replace(root_ref.content, r"\s+" => "")
end

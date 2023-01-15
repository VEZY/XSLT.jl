xml_file = joinpath(dirname(@__FILE__), "files", "doc.xml")
xslt_file = joinpath(dirname(@__FILE__), "files", "style.xml")

@testset "xml_xslt parameters" begin
    @test xml_xslt(xml_file, xslt_file) == "author: \nreviewer: \n"
    @test xml_xslt(xml_file, xslt_file, String["author", "\"jeroen\"", "reviewer", "\"bert\""]) == "author: jeroen\nreviewer: bert\n"
    @test xml_xslt(xml_file, xslt_file, (author="jeroen", reviewer="bert")) == "author: jeroen\nreviewer: bert\n"
    @test xml_xslt(xml_file, xslt_file, Dict("author" => "jeroen", "reviewer" => "bert")) == "author: jeroen\nreviewer: bert\n"
end
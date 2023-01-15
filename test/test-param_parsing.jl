@testset "xml_xslt parameters" begin
    ref = String["param1", "1", "param2", "2", "param3", "\"this is a string value\""]

    @test ref == XSLT.parse_parameters(["param1 1", "param2 2", "param3 \"this is a string value\""])
    @test ref == XSLT.parse_parameters((param1=1, param2=2, param3="this is a string value"))
    @test ref == XSLT.parse_parameters([:param1 => 1, :param2 => 2, :param3 => "this is a string value"])
    @test ref == XSLT.parse_parameters(Dict("param1" => 1, "param2" => 2, "param3" => "this is a string value"))
    @test ref == XSLT.parse_parameters(Dict(:param1 => 1, :param2 => 2, :param3 => "this is a string value"))
end
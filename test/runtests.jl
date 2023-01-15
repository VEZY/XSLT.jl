using XSLT
using Test
using EzXML
using LightXML

# Test files are from https://www.w3schools.com/xml, e.g.: https://www.w3schools.com/xml/cd_catalog.xml
# Tests heavily inspired from R's xslt package: https://github.com/ropensci/xslt/

@testset "XSLT.jl" begin
    @testset "xml_xslt" begin
        include("test-xml_xslt.jl")
    end

    @testset "parameters parsing" begin
        include("test-param_parsing.jl")
    end

    @testset "xml_xslt with parameters" begin
        include("test-parameters.jl")
    end
end





module XSLT

using XSLT_jll

# Interface to the C API:
include("api/structs.jl")
include("api/xml_parse.jl")
include("api/stylesheet_parse.jl")
include("api/xsltApplyStylesheet.jl")
include("api/to_string.jl")
include("api/cleanup.jl")
include("api/apply_stylesheet_to_doc.jl")

# utils
include("parse_parameters.jl")

# Interface to the Julia API:
include("read_stylesheet.jl")
include("read_xml.jl")
include("xml_xslt.jl")

export read_stylesheet, read_xml, xml_xslt

end

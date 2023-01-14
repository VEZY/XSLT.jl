module XSLT

using XSLT_jll

include("api/structs.jl")
include("api/xml_parse.jl")
include("api/stylesheet_parse.jl")
include("api/apply_stylesheet_to_doc.jl")
include("api/to_string.jl")
include("api/cleanup.jl")
include("api/apply_stylesheet_to_file.jl")

export file_xslt_apply

end

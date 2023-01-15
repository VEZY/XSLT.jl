var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = XSLT","category":"page"},{"location":"#XSLT","page":"Home","title":"XSLT","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for XSLT.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [XSLT]","category":"page"},{"location":"#XSLT.Xptr","page":"Home","title":"XSLT.Xptr","text":"Xptr\n\nA pointer to an xsltPtr. This is a trick to make a xsltStylesheetPtr and xmlDocPtr  pointers. \n\n\n\n\n\n","category":"type"},{"location":"#XSLT.xsltPtr","page":"Home","title":"XSLT.xsltPtr","text":"xsltPtr\n\nA buffer structure used for temporary storage. The idea is to map this struct to other structs in libxslt.\n\nI stole this from LightXML.jl. See their implementations of the xmlBuffer  here.\n\n\n\n\n\n","category":"type"},{"location":"#XSLT.doc_xslt_apply-Union{Tuple{S}, Tuple{S, Any, Any}} where S<:AbstractString","page":"Home","title":"XSLT.doc_xslt_apply","text":"doc_xslt_apply(doc, xslt, params)\n\nApply the stylesheet xslt to the XML doc with the given params.\n\nArguments\n\ndoc: can be a file path or an EzXML.jl Document or a LightXML.jl XMLDocument.\nxslt: can be a file path or an xsltPtr (output of read_stylesheet).\nparams: a vector of strings with key-values for parameters, e.g. [\"param_name=param_value\", \"param_name2=param_value2\"].\n\nExample\n\nusing EzXML\n\n# Get the path to the test files in the package:\ntest_dir = joinpath(dirname(pathof(XSLT)), \"..\", \"test\", \"files\")\n\nxml = readxml(joinpath(test_dir, \"cd_catalog.xml\"))\nxslt = joinpath(test_dir, \"cd_catalog.xsl\")\n\nres = doc_xslt_apply(xml, xslt)\n\nwrite(\"cd_catalog.html\", res)\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.get_x-Tuple{S} where S<:AbstractString","page":"Home","title":"XSLT.get_x","text":"get_x(x)\n\nReturn x if it is a file path or a pointer (Ptr), or get the pointer to the xmlDocPtr from x if x is an EzXML.jl Document or a LightXML.jl XMLDocument.\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.keep_string_quoted-Tuple{String}","page":"Home","title":"XSLT.keep_string_quoted","text":"keep_string_quoted(s)\n\nIf s is a string, return a string with quotes around it. Otherwise, return string(s). It is used to keep the quotes around the parameters in the xml_xslt function.\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.parse_parameters-Tuple{Vector{String}}","page":"Home","title":"XSLT.parse_parameters","text":"parse_parameters(params)\n\nConvert the parameters to a vector of strings. The parameters can be a vector of strings, a named tuple, a dictionary, or nothing. If the parameters are a vector of strings, they are returned as is. If the parameters are a named tuple or a dictionary, they are converted to a vector of strings. If the parameters are nothing, an empty vector of strings is returned.\n\nThe vector of strings is used as input parameters to xsltApplyStylesheet, which expects a null-terminated array of strings. The strings are of the form key value. The key is the name of the parameter and the value is the value of the parameter. The value can be a string, a number, or a boolean. If the value is a string, it must be quoted, i.e. key \"value\".\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.read_stylesheet-Tuple{S} where S<:String","page":"Home","title":"XSLT.read_stylesheet","text":"read_stylesheet(filename::String)\n\nRead the stylesheet filename and return a xsltPtr (equivalent to xsltStylesheetPtr). The stylesheet can then be applied to an XML document using xml_xslt.\n\nExample\n\nusing XSLT\n\n# Get the stylesheet from the test files in the package:\nfile = joinpath(dirname(pathof(XSLT)), \"..\", \"test\", \"files\", \"cd_catalog.xsl\")\n\n# Read the stylesheet:\nxslt = read_stylesheet(file)\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.read_xml-Tuple{Any}","page":"Home","title":"XSLT.read_xml","text":"read_xml(file)\n\nRead the XML file file and return a xsltPtr (equivalent to xmlDocPtr).\n\nThe function does not parse the XML file, it just reads it and put it in a pointer  for further usage in the XSLT package. If you want to parse the XML file, use the  functions from EzXML.jl or LightXML.jl.\n\nExample\n\nusing XSLT\n\n# Get the XML file from the test files in the package:\nfile = joinpath(dirname(pathof(XSLT)), \"..\", \"test\", \"files\", \"cd_catalog.xml\")\n\n# Read the XML file:\nxml = read_xml(file)\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.xmlFreeDoc-Tuple{Ptr{XSLT.xsltPtr}}","page":"Home","title":"XSLT.xmlFreeDoc","text":"xmlFreeDoc(res::Xptr)\n\nFree the memory allocated to the document res.\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.xmlParseFile-Tuple{String}","page":"Home","title":"XSLT.xmlParseFile","text":"xmlParseFile(filename::String)\n\nParse an XML file into a document.\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.xml_xslt","page":"Home","title":"XSLT.xml_xslt","text":"xml_xslt(x, xslt, params= nothing)\n\nApply the stylesheet xslt to the XML x with the given params.\n\nArguments\n\nx: can be a file path, a pointer returned by read_xml, an EzXML.jl Document\n\nor a LightXML.jl XMLDocument.\n\nxslt: can be a file path or an xsltPtr (output of read_stylesheet).\nparams: a dictionnary, tuple or Vector{Pair} of key-values for parameters. Can also be \n\ndirecty a vector of strings of the form [\"param1\", \"\"stringvalue1\"\", \"param2\", \"1\"].\n\nReturns the result as a string.\n\nExample\n\nusing EzXML\nusing XSLT\n\n# Get the path to the test files in the package:\ntest_dir = joinpath(dirname(pathof(XSLT)), \"..\", \"test\", \"files\")\n\nxml = readxml(joinpath(test_dir, \"cd_catalog.xml\"))\nxslt = joinpath(test_dir, \"cd_catalog.xsl\")\n\nres = xml_xslt(xml, xslt)\n\nwrite(\"cd_catalog.html\", res)\n\n\n\n\n\n","category":"function"},{"location":"#XSLT.xsltApplyStylesheet-Tuple{Ptr{XSLT.xsltPtr}, Any, Any}","page":"Home","title":"XSLT.xsltApplyStylesheet","text":"xsltApplyStylesheet(xslt::Xptr, doc::Xptr, params<:AbstractString)\n\nApply the stylesheet xslt to the document doc with the given params.\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.xsltFreeStylesheet-Tuple{Ptr{XSLT.xsltPtr}}","page":"Home","title":"XSLT.xsltFreeStylesheet","text":"xsltFreeStylesheet(cur::Xptr)\n\nFree the memory allocated to the stylesheet cur.\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.xsltParseStylesheetFile-Tuple{S} where S<:String","page":"Home","title":"XSLT.xsltParseStylesheetFile","text":"xsltParseStylesheetFile(filename::String)\n\nParse an XSLT file into a stylesheet.\n\n\n\n\n\n","category":"method"},{"location":"#XSLT.xsltSaveResultToString-Tuple{Ptr{XSLT.xsltPtr}, Ptr{XSLT.xsltPtr}}","page":"Home","title":"XSLT.xsltSaveResultToString","text":"xsltSaveResultToString(xml::Xptr, xslt::Xptr)\n\nReturn the transformed XML file (xml) to a string considering an xslt transformation.  The xslt is given so that output-related information contained in the stylesheet, such as the encoding to be used, is used in output.\n\nSee doc and tutorial here: https://gnome.pages.gitlab.gnome.org/libxslt/tutorial2/libxslt_pipes.html\n\nReturns a tuple of two: the output string and its length.\n\n\n\n\n\n","category":"method"}]
}

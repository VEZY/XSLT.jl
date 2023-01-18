"""
    read_xml(file)

Read the XML file `file` and return a `xsltPtr` (equivalent to `xmlDocPtr`).

The function does not parse the XML file, it just reads it and put it in a pointer 
for further usage in the XSLT package. If you want to parse the XML file, use the 
functions from EzXML.jl or LightXML.jl.

# Example

```julia
using XSLT

# Get the XML file from the test files in the package:
file = joinpath(dirname(pathof(XSLT)), "..", "test", "files", "cd_catalog.xml")

# Read the XML file:
xml = read_xml(file)
```
"""
function read_xml(file)
    return xmlReadFile(file)
end
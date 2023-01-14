
"""
    xsltPtr

A buffer structure used for temporary storage.
The idea is to map this struct to other structs in libxslt.

I stole this from `LightXML.jl`. See their implementations of the xmlBuffer 
[here](https://github.com/JuliaIO/LightXML.jl/blob/57b195fe77524c69507e97822d300cf7a81e7a5b/src/LightXML.jl#L28).
"""
struct xsltPtr end

"""
    Xptr

A pointer to an `xsltPtr`. This is a trick to make a xsltStylesheetPtr and xmlDocPtr 
pointers. 
"""
const Xptr = Ptr{xsltPtr}


"""
    keep_string_quoted(s)

If `s` is a string, return a string with quotes around it. Otherwise, return `string(s)`.
It is used to keep the quotes around the parameters in the `xml_xslt` function.
"""
keep_string_quoted(s::String) = string("\"", s, "\"")
keep_string_quoted(s) = string(s)


"""
    parse_parameters(params)

Convert the parameters to a vector of strings. The parameters can be a vector of strings,
a named tuple, a dictionary, or nothing. If the parameters are a vector of strings, they
are returned as is. If the parameters are a named tuple or a dictionary, they are converted
to a vector of strings. If the parameters are nothing, an empty vector of strings is returned.

The vector of strings is used as input parameters to `xsltApplyStylesheet`, which expects
a null-terminated array of strings. The strings are of the form `key value`. The `key` is
the name of the parameter and the `value` is the value of the parameter. The `value` can be
a string, a number, or a boolean. If the `value` is a string, it must be quoted, *i.e.*
`key "value"`.
"""
function parse_parameters(params::Vector{String})
    # Split the strings on spaces, but keep the spaces inside quotes
    params = split.(params, r"""\s+(?=(?:[^\""]*\"[^\""]*\")*[^\""]*$)""")

    return vcat(params...)
end

# parse_parameters for named tuple:
function parse_parameters(params::NamedTuple)
    # Convert the named tuple to a vector of strings
    return vcat([[string(k), keep_string_quoted(v)] for (k, v) in pairs(params)]...)
end

# parse_parameters for dictionary:
function parse_parameters(params::T) where {T<:AbstractDict}
    # Convert the dictionary to a vector of strings
    return vcat([[string(k), keep_string_quoted(params[k])] for k in sort(collect(keys(params)))]...)
end

function parse_parameters(params::T) where {T<:Vector{<:Pair}}
    # Convert the dictionary to a vector of strings
    return vcat([[string(k), keep_string_quoted(v)] for (k, v) in params]...)
end

# parse_parameters for nothing:
function parse_parameters(params::Nothing)
    return String[]
end

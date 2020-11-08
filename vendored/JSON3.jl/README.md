
# JSON3.jl

[![Build Status](https://travis-ci.com/quinnj/JSON3.jl.svg?branch=master)](https://travis-ci.com/quinnj/JSON3.jl)
[![codecov](https://codecov.io/gh/quinnj/JSON3.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/quinnj/JSON3.jl)

### Documentation

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://quinnj.github.io/JSON3.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://quinnj.github.io/JSON3.jl/dev)

*Yet another JSON package for Julia; this one is for speed and slick struct mapping*

**TL;DR**
```julia
# builtin reading/writing
JSON3.read(json_string)
JSON3.write(x)

# custom types
JSON3.read(json_string, T; kw...)
JSON3.write(x)

# custom types: incrementally update a mutable struct
x = T()
JSON3.read!(json_string, x; kw...)
JSON3.write(x)
```

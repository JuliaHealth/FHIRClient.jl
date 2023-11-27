# This is the default target
.PHONY: default
default:
	$(error You must provide a target)

### JuliaFormatter
.PHONY: format-fix
format-fix:
	JULIA_LOAD_PATH="@:@stdlib" julia --startup-file=no --project=.format -e 'import Pkg; Pkg.instantiate(); Pkg.precompile()'
	JULIA_LOAD_PATH="@" julia --startup-file=no --project=.format -e 'using JuliaFormatter; format("."; verbose=true)'

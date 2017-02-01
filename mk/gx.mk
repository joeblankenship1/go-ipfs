gx-path = gx/ipfs/$(shell gx deps find $(1))/$(1)

gx-deps: bin/gx bin/gx-go
	gx --verbose install --global
.PHONY: gx-deps

DEPS_GO += gx-deps

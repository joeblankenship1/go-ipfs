gx-path = gx/ipfs/$(shell gx deps find $(1))/$(1)

gx-deps: bin/gx bin/gx-go
	gx --verbose install --global > /dev/null 2>&1
.PHONY: gx-deps

DEPS_GO += gx-deps

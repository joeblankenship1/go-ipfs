gx-path = gx/ipfs/$(shell gx deps find $(1))/$(1)

gx-deps: bin/gx bin/gx-go $(CHECK_GO)
	gx --verbose install --global

DEPS_GO += gx-deps

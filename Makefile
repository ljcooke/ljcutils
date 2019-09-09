.PHONY: default analyze test

default: analyze test

analyze:
	shellcheck bin/*

test:
	bats test

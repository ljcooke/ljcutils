.PHONY: default lint test

default: lint test

lint:
	shellcheck bin/*

test:
	bats test

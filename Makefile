.PHONY: lint bats test

lint:
	shellcheck -e SC1090,SC2034 subcommands/* commands config functions internal-functions uninstall
bats:
	bats tests
test: bats

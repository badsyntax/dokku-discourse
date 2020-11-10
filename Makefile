.PHONY: lint

lint:
	docker run -v "$(CURDIR):/mnt" koalaman/shellcheck subcommands/* commands config functions internal-functions

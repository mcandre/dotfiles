.PHONY: all audit lint test clean

all: lint

audit: safety

safety:
	@safety check

shfmt:
	@stank -exInterp zsh . | \
		xargs -n 1 shfmt -w -i 4

bashate:
	@stank . | \
		xargs -n 1 bashate -i E006

funk:
	@funk .

slick:
	@stank -sh . | \
		xargs -n 1 slick

shellcheck:
	@stank -exInterp zsh . | \
		xargs -n 1 shellcheck

yamllint:
	@yamllint -s .yamllint .

checkmake:
	@find . \
		-type f \
		\( \
			-iname Makefile -o \
			-iname GNUmakefile -o \
			-iname '*.mk' -o \
			-iname '*.make' \
		\) \
		-print0 | \
			xargs -0 -n 1 checkmake

unmake:
	@unmake makefile

lint: shfmt funk slick shellcheck yamllint checkmake unmake

test:
	@echo "nothing to do"

clean:
	@echo "nothing to do"

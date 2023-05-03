.POSIX:
.SILENT:
.PHONY: all audit lint safety shfmt bashate funk slick shellcheck yamllint unmake

all: lint

audit: safety

safety:
	safety check

shfmt:
	stank -exInterp zsh . | \
		xargs -n 1 shfmt -w -i 4

bashate:
	stank . | \
		xargs -n 1 bashate -i E006

funk:
	funk .

slick:
	stank -sh . | \
		xargs -n 1 slick

shellcheck:
	stank -exInterp zsh . | \
		xargs -n 1 shellcheck

yamllint:
	yamllint -s .yamllint .

unmake:
	unmake .

lint: shfmt funk slick shellcheck yamllint unmake

.POSIX:
.SILENT:
.PHONY: all \
	audit \
	lint \
	safety \
	shfmt \
	bashate \
	funk \
	slick \
	shellcheck \
	snyk \
	unmake \
	yamllint

all: lint

audit: safety snyk

safety:
	safety check

snyk:
	snyk test

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

unmake:
	unmake .

yamllint:
	yamllint -s .yamllint .

lint: shfmt funk slick shellcheck unmake yamllint

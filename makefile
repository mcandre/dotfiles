.POSIX:
.SILENT:
.PHONY: \
	all \
	audit \
	govulncheck \
	kirill \
	lint \
	shellcheck \
	shfmt \
	slick

all: lint

audit: govulncheck

govulncheck:
	govulncheck -scan package ./...

kirill:
	kirill .

lint: \
	kirill \
	shellcheck \
	shfmt \
	slick

shellcheck:
	stank -print0 | \
		xargs -0 -n 1 shellcheck

shfmt:
	stank -print0 -exInterp zsh . | \
		xargs -0 -n 1 shfmt -w -i 4

slick:
	stank -print0 -sh . | \
		xargs -0 -n 1 slick

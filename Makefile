.PHONY: all lint test clean

all: lint

safety:
	safety check

shfmt:
	@stank -exInterp zsh . | grep -v node_modules | xargs shfmt -w -i 4

bashate:
	stank . | grep -v node_modules | xargs bashate

funk:
	@funk .

shellcheck:
	@stank -exInterp zsh . | grep -v node_modules | xargs shellcheck

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

lint: safety shfmt funk shellcheck yamllint checkmake

test:
	@echo "nothing to do"

clean:
	@echo "nothing to do"

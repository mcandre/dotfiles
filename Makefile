all: lint

safety:
	safety check

shfmt:
	stank . | grep -v node_modules | xargs shfmt -w -i 4

bashate:
	stank . | grep -v node_modules | xargs bashate

checkbashisms:
	@stank . | grep -v node_modules | xargs checkbashisms

funk:
	@funk .

shellcheck:
	@stank . | grep -v node_modules | xargs shellcheck

yamllint:
	@yamllint -s .yamllint .

editorconfig:
	@git ls-files -z | grep -av patch | xargs -0 -r -n 100 $(shell npm bin)/eclint check

lint: safety shfmt funk shellcheck yamllint editorconfig

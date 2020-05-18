all: lint

safety:
	safety check

funk:
	@funk .

shellcheck:
	@stank . | grep -v node_modules | xargs shellcheck

checkbashisms:
	@stank . | grep -v node_modules | xargs checkbashisms

yamllint:
	@yamllint -s .yamllint .

editorconfig:
	@git ls-files -z | grep -av patch | xargs -0 -r -n 100 $(shell npm bin)/eclint check

lint: safety funk shellcheck yamllint editorconfig

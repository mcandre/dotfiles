all: lint

safety:
	safety check

shfmt:
	stank . | grep -v node_modules | xargs shfmt -w -i 4

bashate:
	stank . | grep -v node_modules | xargs bashate

funk:
	@funk .

shellcheck:
	@stank -exInterp zsh . | grep -v node_modules | xargs shellcheck

yamllint:
	@yamllint -s .yamllint .

lint: safety shfmt funk shellcheck yamllint

all: lint

safety:
	safety check

funk:
	@funk .

yamllint:
	@yamllint -s .yamllint
	@yamllint -s .

editorconfig:
	@git ls-files -z | grep -av patch | xargs -0 -r -n 100 $(shell npm bin)/eclint check

lint: safety funk yamllint editorconfig

all: lint

funk:
	@funk .

yamllint:
	@yamllint .yamllint
	@yamllint .

editorconfig:
	@git ls-files -z | xargs -0 -r -n 100 $(shell npm bin)/eclint check

lint: funk yamllint editorconfig

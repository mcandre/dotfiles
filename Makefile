all: lint

funk:
	funk .

yamllint:
	yamllint .yamllint
	yamllint .

editorconfig:
	$(shell npm bin)/eclint check

lint: funk yamllint editorconfig

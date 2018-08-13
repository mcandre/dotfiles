all: lint

lint: funk yamllint

funk:
	funk .

yamllint:
	yamllint .yamllint
	yamllint .

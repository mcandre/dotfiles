.POSIX:
.SILENT:
.PHONY: all

all:
	go install golang.org/x/vuln/cmd/govulncheck@latest
	go install tool
	go mod tidy

	python3 -m venv .venv
	.venv/bin/python3 -m pip install --upgrade pip setuptools
	.venv/bin/python3 -m pip install -r requirements.txt

	cargo install -f kirill@0.0.6

.POSIX:
.SILENT:
.PHONY: \
	all \
	go \
	python \
	rust

all: go python rust

go:
	go install golang.org/x/vuln/cmd/govulncheck@latest
	go install tool
	go mod tidy

python:
	python3 -m venv .venv
	.venv/bin/python3 -m pip install --upgrade pip setuptools
	.venv/bin/python3 -m pip install -r requirements.txt

rust:
	cargo install --force unmake@0.0.21

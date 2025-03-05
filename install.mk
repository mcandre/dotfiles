.POSIX:
.SILENT:
.PHONY: \
	all \
	go \
	python \
	rust

all: go python rust

go:
	go install tool

python:
	python3 -m venv .venv
	.venv/bin/python3 -m pip install --upgrade pip setuptools
	.venv/bin/python3 -m pip install -r requirements.txt

rust:
	cargo install --force unmake@0.0.17

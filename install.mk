.POSIX:
.SILENT:
.PHONY: all

all:
	cargo install --force kirill@0.0.13

	go install golang.org/x/vuln/cmd/govulncheck@latest
	go install tool
	go mod tidy

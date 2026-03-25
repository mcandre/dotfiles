# DEVELOPMENT

We follow standard, `make` based operations for performing build operations.

# DEV ENVIRONMENT

## Prerequisites

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* [asdf](https://asdf-vm.com/)
* [awk](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/awk.html)
* [bash](https://www.gnu.org/software/bash/) 4+
* [EditorConfig](https://editorconfig.org/)
* [findutils](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/find.html)
* [Go](https://go.dev/)
* [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)
* [Rust](https://rust-lang.org/)
* [ShellCheck](https://www.shellcheck.net/) 0.11.0+
* [zsh](https://www.zsh.org/)
* Provision additional dev tools with `make -f install.mk`

## Recommended

* [asdf](https://asdf-vm.com/)

# TASKS

We automate engineering tasks.

## Security Audit

```sh
make audit
```

## Lint

```sh
make
```

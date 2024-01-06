# Dotfiles - Configuration files

# HOMEPAGE

https://github.com/mcandre/dotfiles

# REQUIREMENTS

* a POSIX compliant [make](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html) implementation (e.g. GNU make, BSD make, etc.)
* GNU compatible [findutils](https://www.gnu.org/software/findutils/)
* [GNU grep](https://www.gnu.org/software/grep/)
* [Go](https://golang.org/) 1.21.5+
* [Node.js](https://nodejs.org/en) 20.10.0+
* [Python](https://www.python.org/) 3.12.1+
* [Rust](https://www.rust-lang.org/en-US/) 1.75.0+
* Provision additional dev tools with `make -f install.mk`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10 (run `asdf reshim` after provisioning)
* [direnv](https://direnv.net/) 2

# TERMINAL COLORS

[Monokai](http://www.reddit.com/r/commandline/comments/1q4b90/is_there_a_monokai_port_for_nano/)

# AUDIT

```console
$ make audit
```

# LINT

```console
$ make lint
```

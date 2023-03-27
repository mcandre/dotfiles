# Dotfiles - Configuration files

# HOMEPAGE

https://github.com/mcandre/dotfiles

# REQUIREMENTS

* [make](https://pubs.opengroup.org/onlinepubs/009695299/utilities/make.html)
* a POSIX compatible [sh](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html) implementation
* GNU compatible [findutils](https://www.gnu.org/software/findutils/)
* [GNU grep](https://www.gnu.org/software/grep/)
* [Go](https://golang.org/) 1.20.2+ with `go install github.com/mcandre/accio/cmd/accio@v0.0.4` and `accio -install`
* [Node.js](https://nodejs.org/en) 16.14.2+ with `npm install -g snyk@1.996.0`
* [Python](https://www.python.org/) 3.11.2+ with `pip[3] install --upgrade pip setuptools` and `pip[3] install -r requirements-dev.txt`

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

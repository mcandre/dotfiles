# Dotfiles - Configuration files

# HOMEPAGE

https://github.com/mcandre/dotfiles

# REQUIREMENTS

* POSIX compatible [findutils](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/find.html)
* POSIX compatible [grep](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/grep.html)
* POSIX compatible [sh](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html)
* [Go](https://golang.org/) 1.21.5+
* [Python](https://www.python.org/) 3.12.1+
* Provision additional dev tools with `./install`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10 (run `asdf reshim` after provisioning)
* [direnv](https://direnv.net/) 2

# TERMINAL COLORS

[Monokai](http://www.reddit.com/r/commandline/comments/1q4b90/is_there_a_monokai_port_for_nano/)

# AUDIT

```console
$ ./build audit
```

# LINT

```console
$ ./build [lint]
```

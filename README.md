# Dotfiles - Configuration files

# HOMEPAGE

https://github.com/mcandre/dotfiles

# NOTABLE CONFIGURATIONS

## ASDF

[ASDF](https://asdf-vm.com/) isolates programming environments on a per-project, per-directory basis. This enables engineers to work on multiple projects with less friction about conflicting programming language versions.

Examples:

* [.tool-versions](.tool-versions) configuration for developing this dotfiles project
* Home directory default: Copy [src/global.tool-versions](src/global.tool-versions) to `~/.tool-versions`

## EditorConfig

The [EditorConfig](https://editorconfig.org/) system provides a standard way to configure basic text file settings. It is cross-programming-language, cross-text-editor, and cross-platform. If needed, per-directory or per-project configurations can be applied, in order to support conflicting indentation styles or whathaveyou.

An thorough example [.editorconfig](.editorconfig) file sets up many projects for success.

## gitignore

[src/.profile.d/gitignore.sh](src/.profile.d/gitignore.sh) implements a CLI for the popular [gitignore.io](https://www.toptal.com/developers/gitignore) pattern database.

## ll

A common UNIX alias for rapidly listing information about files in the current directory, *in detail*.

Setup via [src/.profile.d/ll.sh](src/.profile.d/ll.sh).

## open

The convenient macOS [open](https://ss64.com/mac/open.html) command line tool accepts a directory or file path argument, launching the file graphically with the default application. This is helpful for quickly exploring large directory trees and project artifacts.

It is provided with the base macOS operating system. Equivalent aliases for `open` are provided in example shell configuration snippets:

* [UNIX (XDG)](src/.profile.d/open.x11.sh)
* [Windows (cmd.exe)](src/open.cmd)
* [Windows (PowerShell)](src/profile.ps1)

# LICENSE

BSD-2-Clause

# REQUIREMENTS

* [GNU](https://www.gnu.org/)/[BSD](https://en.wikipedia.org/wiki/Berkeley_Software_Distribution) [findutils](https://en.wikipedia.org/wiki/Find_(Unix))
* [POSIX](https://pubs.opengroup.org/onlinepubs/9799919799/) compatible [grep](https://en.wikipedia.org/wiki/Grep)
* [Go](https://go.dev/) 1.24.4+
* [kirill](https://github.com/mcandre/kirill) 0.0.1
* [POSIX](https://pubs.opengroup.org/onlinepubs/9799919799/) compatible [make](https://en.wikipedia.org/wiki/Make_(software))
* [Python](https://www.python.org/) 3.13.5+
* [Rust](https://www.rust-lang.org/) 1.87.0+
* [POSIX](https://pubs.opengroup.org/onlinepubs/9799919799/) compatible [sh](https://en.wikipedia.org/wiki/Unix_shell)
* [ShellCheck](https://www.shellcheck.net/) 0.10.0+
* [Snyk](https://snyk.io/)
* Provision additional dev tools with `make -f install.mk [-j 4]`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10 (run `asdf reshim` after provisioning)
* [direnv](https://direnv.net/) 2
* [GNU](https://www.gnu.org/) [grep](https://en.wikipedia.org/wiki/Grep)
* [GNU](https://www.gnu.org/)/[BSD](https://en.wikipedia.org/wiki/Berkeley_Software_Distribution) [make](https://en.wikipedia.org/wiki/Make_(software))
* [zsh](https://www.zsh.org/)

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

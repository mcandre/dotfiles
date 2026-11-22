# dotfiles: configuration files

[![CI/CD](https://badgen.net/github/checks/mcandre/dotfiles?icon=github)](https://github.com/mcandre/dotfiles/actions) [![License](https://badgen.net/static/license/BSD/ab2b29?icon=freebsd)](LICENSE.md) [![AI](https://badgen.net/static/ai/Gemini|hint?color=886fbf&icon=google-gemini)](AI-DECLARATION.md) [![Donate](https://badgen.net/static/sponsor/%E2%99%A5?color=bf3988&icon=github)](https://github.com/sponsors/mcandre)

![colorful terminal](screenshot.png)

# ABOUT

Collection of configurations for safe, fast, software development.

# BOOTSTRAP

## Debian Family

```sh
sudo apt-get update
sudo apt-get install -y git
git clone https://github.com/mcandre/dotfiles.git ~/src/github.com/mcandre/dotfiles
cd ~/src/github.com/mcandre/dotfiles
src/bootstrap.debian.sh
```

## macOS

```sh
xcode-select --install
git clone https://github.com/mcandre/dotfiles.git ~/src/github.com/mcandre/dotfiles
cd ~/src/github.com/mcandre/dotfiles
src/bootstrap.macos.sh
```

# REQUIREMENTS

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* [asdf](https://asdf-vm.com/)
* [awk](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/awk.html)
* [findutils](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/find.html)

## macOS

* [Rex](https://www.superlogical.com/rex/docs/installation)
* [Xcode](https://developer.apple.com/xcode/)

## Recommended

* [lessutils](https://www.greenwoodsoftware.com/less/)
* [mcandre/kickers](https://github.com/mcandre/kickers)

For details on building from source, see [DEVELOPMENT](DEVELOPMENT.md).

# WINDOWS TERMINAL

`~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`

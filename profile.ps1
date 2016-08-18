# Copy or Soft Link to ...\Documents\WindowsPowerShell\profile.ps1
#
# Requires elevated permissions to be loaded:
#
# PS admin> Set-ExecutionPolicy Unrestricted -Scope CurrentUser

function vi { vim.exe $args }
function view { vim.exe -R $args }
function emacs { emacs.exe -nw $args }
function ll { cmd /c dir $args }
function gitignore { curl.exe -k https://www.gitignore.io/api/$args }

& "C:\Program Files\Docker Toolbox\docker-machine.exe" env default | Invoke-Expression

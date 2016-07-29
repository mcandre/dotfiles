# Copy to Documents\WindowsPowerShell\profile.ps1
#
# Requires elevated permissions to be loaded:
#
# PS admin> Set-ExecutionPolicy Unrestricted -Scope CurrentUser

New-Alias vi vim
New-Alias emacs emacs -nw

& "C:\Program Files\Docker Toolbox\docker-machine.exe" env default | Invoke-Expression

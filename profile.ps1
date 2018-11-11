# Copy or Soft Link to ...\Documents\WindowsPowerShell\profile.ps1
#
# Requires elevated permissions to be loaded:
#
# PS admin> Set-ExecutionPolicy Unrestricted -Scope CurrentUser

function vi { vim.exe $args }
function view { vim.exe -R $args }
function emacs { emacs.exe -nw $args }
function ll { cmd /c dir /a $args }
function gitignore { curl.exe -k https://www.gitignore.io/api/$args }
function lsdu {
    $folders = Get-ChildItem $args | select Name,@{n="Length"; e={[long](ls $_ -file -rec | measure Length -sum | % Sum)}} | sort Length -d
    $files = Get-ChildItem -File | select Name, Length | sort Length -d
    $list = $folders + $files

    return $list
}

& "C:\Program Files\Docker Toolbox\docker-machine.exe" env default | Invoke-Expression
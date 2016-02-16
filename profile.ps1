# Copy to Documents\WindowsPowerShell\profile.ps1

$ui = (Get-Host).UI.RawUI
$ui.WindowSize.Width = 300
$ui.WindowSize.Height = 80
$ui.BackgroundColor = "Black"
$ui.ForegroundColor = "White"

function prompt {
  Write-Host "$(get-location)>"  -nonewline -foregroundcolor White
  return ' '
}

Set-Location Desktop
cls

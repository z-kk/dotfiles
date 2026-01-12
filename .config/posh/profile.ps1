. $HOME\.config\posh\env.ps1
. $HOME\.config\posh\functions.ps1

# PS color config
Set-PSReadLineOption -Colors @{
    "Operator" = [ConsoleColor]::Gray
    "Parameter" = [ConsoleColor]::Magenta
}

# PS key-bind
Set-PSReadLineKeyHandler -Key ctrl+d -Function DeleteCharOrExit
Set-PSReadLineKeyHandler -Key ctrl+l -Function ClearScreen

# bash-like completion
Set-PSReadLineKeyHandler -Key Tab -Function Complete
# zsh-like completion
#Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# prompt
Set-Theme onehalf.minimal

# git prompt
Import-Module posh-git

# alias
Set-Alias -Name open -Value start

# zoxide
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

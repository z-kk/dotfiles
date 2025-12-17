Set-Item env:Path $env:Path.Replace("$HOME\.local\bin;", "")
Set-Item env:Path "$HOME\.local\bin;$env:Path"

Set-Item env:HOME $HOME
Set-Item env:XDG_CONFIG_HOME (($HOME -replace '\\','/') + "/.config")

#Set-Item env:VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
if (Get-Command nvim.exe -ErrorAction SilentlyContinue) {
    Set-Item env:EDITOR nvim.exe
} elseif (Get-Command vim.exe -ErrorAction SilentlyContinue) {
    Set-Item env:EDITOR vim.exe
} else {
    Set-Item env:EDITOR notepad.exe
}

Set-Item env:_ZO_EXCLUDE_DIRS "$HOME;$env:LOCALAPPDATA/bookmarks/*"

Set-Item env:YAZI_CONFIG_HOME "$env:XDG_CONFIG_HOME/yazi"

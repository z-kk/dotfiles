$gnuWin32bin = Get-ChildItem $env:LOCALAPPDATA\Microsoft\WinGet\Packages\GnuWin32*\bin -ErrorAction SilentlyContinue
foreach ($dir in $gnuWin32bin) {
    Prepend-Path $dir
}
Prepend-Path "C:\Program Files (x86)\GnuWin32\bin"
Prepend-Path "$HOME\.local\bin"

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

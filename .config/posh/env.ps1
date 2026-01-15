$gnuWin32bin = Get-ChildItem $env:LOCALAPPDATA\Microsoft\WinGet\Packages\GnuWin32*\bin -ErrorAction SilentlyContinue
foreach ($dir in $gnuWin32bin) {
    Prepend-Path $dir
}
Prepend-Path "C:\Program Files (x86)\GnuWin32\bin"
Prepend-Path "$HOME\.local\bin"

Set-Item env:HOME $HOME
Set-Item env:XDG_CONFIG_HOME (($HOME -replace '\\','/') + "/.config")

#Set-Item env:VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

Set-Item env:YAZI_CONFIG_HOME "$env:XDG_CONFIG_HOME/yazi"

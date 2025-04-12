#Set-Item env:Path $env:Path.Replace("C:\Program Files (x86);", "")
#Set-Item env:Path "C:\Program Files (x86);$env:Path"

Set-Item env:XDG_CONFIG_HOME "$HOME\.config"

Set-Item env:VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

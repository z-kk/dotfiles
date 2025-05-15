Set-Item env:Path $env:Path.Replace("$HOME\.local\bin;", "")
Set-Item env:Path "$HOME\.local\bin;$env:Path"

Set-Item env:HOME $HOME
Set-Item env:XDG_CONFIG_HOME (($HOME -replace '\\','/') + "/.config")

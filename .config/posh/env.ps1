#Set-Item env:Path $env:Path.Replace("C:\Program Files (x86);", "")
#Set-Item env:Path "C:\Program Files (x86);$env:Path"

Set-Item env:XDG_CONFIG_HOME "$HOME\.config"

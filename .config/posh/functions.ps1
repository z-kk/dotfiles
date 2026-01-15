function Set-Theme($name) {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\${name}.omp.json" | Invoke-Expression
}

function Prepend-Path($path) {
    Set-Item env:Path $env:Path.Replace("$path;", "")
    Set-Item env:Path "$path;$env:Path"
}

function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

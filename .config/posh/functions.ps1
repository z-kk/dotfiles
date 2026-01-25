function Set-Theme($name) {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\${name}.omp.json" | Invoke-Expression
}

function Prepend-Path($path) {
    Set-Item env:Path $env:Path.Replace("$path;", "")
    Set-Item env:Path "$path;$env:Path"
}

function Get-WslInfo($name) {
    $info = Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss
    if ($name -eq $null) {
        return $info
    }
    $info | Where-Object { $_.GetValue("DistributionName") -eq "$name" }
}

function mklnk($name, $path) {
    $UrlExt = ".url"
    $LnkExt = ".lnk"
    if ($path.StartsWith("http")) {
        if (!$name.EndsWith($UrlExt)){
            $name = $name + $UrlExt
        }
    } else {
        if (!$name.EndsWith($LnkExt)) {
            $name = $name + $LnkExt
        }
    }
    $name = [System.IO.Path]::GetFullPath($name, (Get-Location).Path)

    $Shell = New-Object -ComObject WScript.Shell
    $Shortcut = $Shell.CreateShortcut($name)
    $Shortcut.TargetPath = $path
    $Shortcut.Save()
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

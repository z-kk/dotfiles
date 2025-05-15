function Set-Theme($name) {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\${name}.omp.json" | Invoke-Expression
}

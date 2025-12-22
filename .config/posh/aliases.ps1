Import-Module Abbr
Set-Alias -Name abbr -Value ealias

Set-Alias -Name open -Value start

# Git
abbr gs 'git status -s'
abbr glg 'git log --oneline'  # gl -> Get-Location
abbr gla "git log --oneline --all --graph --date=short --pretty=format:'%C(auto)%h %C(magenta)%cd%C(auto)%d %s %C(green)<%cn>' -10"
abbr gb 'git branch -a'
abbr gco 'git checkout'  # gc -> Get-Content
abbr gcmm 'git commit -m "'  # gcm -> Get-Command
abbr gca 'git commit --amend --no-edit'
abbr gd 'git diff'
abbr gr 'git rebase'
abbr grs 'git rebase --skip'
abbr grc 'git rebase --continue'

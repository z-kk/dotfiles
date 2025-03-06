Import-Module Abbr
Set-Alias -Name abbr -Value ealias

Set-Alias -Name open -Value start

Remove-Alias -Force diff
Remove-Alias -Force gl
Remove-Alias -Force gc
Remove-Alias -Force gcm

# Git
abbr gs 'git status -s'
abbr gl 'git log --oneline'
abbr gla "git log --oneline --all --graph --date=short --pretty=format:'%C(auto)%h %C(magenta)%cd%C(auto)%d %s %C(green)<%cn>' -10"
abbr gb 'git branch -a'
abbr gc 'git checkout'
abbr gcm 'git commit -m "'
abbr gca 'git commit --amend --no-edit'
abbr gd 'git diff'
abbr gr 'git rebase'
abbr grs 'git rebase --skip'
abbr grc 'git rebase --continue'

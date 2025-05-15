alias ls='ls -ABF --show-control-chars --color=auto'
alias grep='grep --color=auto'
abbr pipython='pipenv run python'
abbr pipvim='pipenv run vim'
#abbr tmux='tmux -f $TMUXDIR/tmux.conf'
abbr today='date "+%Y-%m-%d %H:%M:%S"'
alias jp='iconv -f cp932 -t utf-8'

abbr service='sudo service'
abbr mount='sudo mount'
abbr umount='sudo umount'
abbr apt='sudo apt'
abbr shutdown='sudo shutdown'

# Vim
alias vim8='vim -c "e ++enc=utf-8"'
alias jetpacksync='vim -c JetpackSync'
abbr unite='vim -c "Unite menu"'
alias simplenote='vim -c SimplenoteList'
alias memolist='vim -c MemoList'

# Git
abbr gs='git status -s'
abbr gl='git log --oneline'
abbr gla="git log --oneline --all --graph --date=short --pretty=format:'%C(auto)%h %C(magenta)%cd%C(auto)%d %s %C(green)<%cn>' -10"
abbr gb='git branch -a'
abbr gc='git checkout'
abbr gcm='git commit -m "'
abbr gca='git commit --amend --no-edit'
abbr gd='git diff'
abbr gr='git rebase'
abbr grs='git rebase --skip'
abbr grc='git rebase --continue'

# Docker
abbr dcb='docker compose build'
abbr dcu='docker compose up -d'
abbr dcd='docker compose down'
abbr dce='docker compose exec'
abbr dcr='docker compose run --rm'
abbr dcl='docker compose logs'
abbr dcp='docker compose ps'

if [[ $OSTYPE =~ linux ]]; then
    # linux
    abbr logoff='gnome-session-quit'

    if [[ ! -z $IS_WSL ]]; then
        # wsl
        abbr -u shutdown
        alias shutdown='wslshutdown'
    fi
elif [[ $OSTYPE =~ cygwin ]]; then
    # cygwin
    alias open='cygstart'
    abbr wkill='taskkill /F /PID'
    alias cyg='mintty -i /Cygwin-Terminal.ico - &'
    alias emac='emacs-w32'
elif [[ $OSTYPE =~ darwin ]]; then
    # mac
    alias ls='ls -ABGF'
    alias grep='grep --color'
fi

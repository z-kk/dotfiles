alias bashrc='vim $BDOTDIR/bashrc'
alias bashpr='vim $BDOTDIR/profile.sh'
alias bashal='vim $BDOTDIR/aliases.sh'
alias bashfn='vim $BDOTDIR/functions.sh'

alias ls='ls -ABF --show-control-chars --color=auto'
alias grep='grep --color=auto'
abbrev-alias pipython='pipenv run python'
abbrev-alias pipvim='pipenv run vim'
abbrev-alias tmux='tmux -f $TMUXDIR/tmux.conf'
abbrev-alias today='date "+%Y-%m-%d %H:%M:%S"'
abbrev-alias jp='iconv -f cp932 -t utf-8'

abbrev-alias service='sudo service'
abbrev-alias mount='sudo mount'
abbrev-alias umount='sudo umount'
abbrev-alias apt='sudo apt'
abbrev-alias shutdown='sudo shutdown'

# Vim
alias vim8='vim -c "e ++enc=utf-8"'
alias jetpacksync='vim -c JetpackSync'
alias simplenote='vim -c SimplenoteList'
alias memolist='vim -c MemoList'

# Git
abbrev-alias gs='git status -s'
abbrev-alias gl='git log --oneline'
abbrev-alias gla="git log --oneline --all --graph --date=short --pretty=format:'%C(auto)%h %C(magenta)%cd%C(auto)%d %s %C(green)<%cn>' -10"
abbrev-alias gb='git branch -a'
abbrev-alias gc='git checkout'
abbrev-alias gcm='git commit -m "'
abbrev-alias gca='git commit --amend --no-edit'
abbrev-alias gd='git diff'

# Docker
abbrev-alias dcb='docker compose build'
abbrev-alias dcu='docker compose up -d'
abbrev-alias dcd='docker compose down'
abbrev-alias dce='docker compose exec'
abbrev-alias dcr='docker compose run --rm'
abbrev-alias dcl='docker compose logs'
abbrev-alias dcp='docker compose ps'

if [[ $OSTYPE =~ linux ]]; then
    # linux
    abbrev-alias logoff='gnome-session-quit'

    if [[ ! -z $IS_WSL ]]; then
        # wsl
        alias open='wslopen'
        abbrev-alias -u shutdown
        alias shutdown='wslshutdown'
    fi
elif [[ $OSTYPE =~ cygwin ]]; then
    # cygwin
    alias open='cygstart'
    abbrev-alias wkill='taskkill /F /PID'
    alias cyg='mintty -i /Cygwin-Terminal.ico - &'
    alias emac='emacs-w32'
elif [[ $OSTYPE =~ darwin ]]; then
    # mac
    alias ls='ls -ABGF'
    alias grep='grep --color'
fi

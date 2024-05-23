alias bashrc='vim $XDG_CONFIG_HOME/bash/bashrc'
alias bashpr='vim $XDG_CONFIG_HOME/bash/profile.sh'
alias bashal='vim $XDG_CONFIG_HOME/bash/aliases.sh'
alias bashfn='vim $XDG_CONFIG_HOME/bash/functions.sh'

alias ls='ls -ABF --show-control-chars --color=auto'
alias grep='grep --color=auto'
alias vim8='vim -c "e ++enc=utf-8"'
alias pipython='pipenv run python'
alias pipvim='pipenv run vim'
alias tmux='tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf'
alias today='date "+%Y-%m-%d %H:%M:%S"'
alias jp='iconv -f cp932 -t utf-8'

# Docker
alias dcb='docker compose build'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dce='docker compose exec'
alias dcr='docker compose run'
alias dcl='docker compose logs'
alias dcp='docker compose ps'

if [[ $OSTYPE =~ linux ]]; then
    # linux
    alias logoff='gnome-session-quit'

    if [[ ! -z $IS_WSL ]]; then
        # wsl
        alias open='wslopen'
        alias shutdown='wslshutdown'
    fi
elif [[ $OSTYPE =~ cygwin ]]; then
    # cygwin
    alias open='cygstart'
    alias wkill='taskkill /F /PID'
    alias cyg='mintty -i /Cygwin-Terminal.ico - &'
    alias emac='emacs-w32'
elif [[ $OSTYPE =~ darwin ]]; then
    # mac
    alias ls='ls -ABGF'
    alias grep='grep --color'
fi

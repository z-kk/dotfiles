shopt -s expand_aliases

alias bashrc='vim ~/.bashrc'
alias bashal='vim ~/.bash_aliases'
alias bashfn='vim ~/.bash_functions'

alias ls='ls -ABF --show-control-chars --color=auto'
alias grep='grep --color=auto'
alias vim8='vim -c "e ++enc=utf-8"'
alias pipython='pipenv run python'
alias pipvim='pipenv run vim'
alias today='date "+%Y-%m-%d %H:%M:%S"'
alias jp='iconv -f cp932 -t utf-8'

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

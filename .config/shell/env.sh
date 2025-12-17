export OSTYPE
if [[ $OSTYPE =~ linux ]]; then
    umask 022
    if [[ -n $(grep -i Microsoft /proc/version) ]]; then
        export IS_WSL=1
        if [[ -n $(ps -o command= -p $(ps -o ppid= -p $$) | grep wsltty) ]]; then
            export IS_WSLTTY=1
        fi
    fi
elif [[ $OSTYPE =~ darwin ]]; then
    # MacOS
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi

if command -v nvim | grep -q "/usr/"; then
    export EDITOR=nvim
elif command -v vim | grep -q "/usr/"; then
    export EDITOR=vim
elif command -v vi | grep -q "/usr/"; then
    export EDITOR=vi
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
export TASKDATA="$XDG_DATA_HOME/task"

export BDOTDIR="$XDG_CONFIG_HOME/bash"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export TMUXDIR="$XDG_CONFIG_HOME/tmux"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export DENO_INSTALL="$HOME/.deno"
export GOROOT="/usr/local/share/go"
export GOPATH="$XDG_DATA_HOME/go"

#export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

export _ZO_EXCLUDE_DIRS="$HOME:$XDG_DATA_HOME/bookmarks/*"

export NNN_OPTS="AdHio"
export NNN_COLORS="#0b0a0c0d;3265"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_BMS="d:$HOME/Downloads;b:$XDG_DATA_HOME/bookmarks"
export NNN_PLUG="p:preview-tui"
if [[ $IS_WSL ]]; then
    export NNN_OPENER="wsl-open"
    export NNN_BMS="d:/mnt/c/Users/$USER/Downloads;b:$XDG_DATA_HOME/bookmarks"
fi

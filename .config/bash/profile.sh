if [[ $READPROF ]]; then
    return
fi

export EDITOR=vim
export LC_COLLATE=C  # lsの並び順
export OSTYPE

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export HISTFILE="$XDG_STATE_HOME/bash/history"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
export TASKDATA="$XDG_DATA_HOME/task"

# pyenv
if [ -e ~/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# nim
export PATH="$HOME/.nimble/bin:$PATH"

# local bin
export PATH="$HOME/.local/bin:$PATH"

if [[ $OSTYPE =~ linux ]]; then
    # linux
    umask 022
    if [[ -n $(grep -i Microsoft /proc/version) ]]; then
        export IS_WSL=1
        if [[ -n $(ps -o command= -p $(ps -o ppid= -p $$) | grep wsltty) ]]; then
            export IS_WSLTTY=1
        fi
    fi
elif [[ $OSTYPE =~ cygwin ]]; then
    # cygwin
    # デスクトップ, ドキュメント, ダウンロードをマウント
    if [ ! -d /desktop ]; then
        mount $(reg query "hkcu\software\microsoft\windows\currentversion\explorer\shell folders" | grep Desktop | awk '{ print $3 }' | sed s/\\\\/\\//g | sed s/\\r//) /desktop
    fi
    if [ ! -d /documents ]; then
        mount $(reg query "hkcu\software\microsoft\windows\currentversion\explorer\shell folders" | grep Personal | awk '{ print $3 }' | sed s/\\\\/\\//g | sed s/\\r//) /documents
    fi
    if [ ! -d /downloads ]; then
        mount $(reg query "hkcu\software\microsoft\windows\currentversion\explorer\shell folders" | grep 374DE290-123F-4565-9164-39C4925E467B | awk '{ print $3 }' | sed s/\\\\/\\//g | sed s/\\r//) /downloads
    fi
elif [[ $OSTYPE =~ darwin ]]; then
    # mac
    # lsの色設定
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi

export READPROF=1

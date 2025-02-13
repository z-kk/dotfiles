set -q SET_ENV
and return

set -x SHELL (which fish)
set -x fish_prompt_pwd_dir_length 0

set -gx LC_ALL
set -gx LANG C.UTF-8
set -gx LC_COLLATE C  # lsの並び順

set -gx EDITOR vim

# XDG
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"

set -gx WGETRC "$XDG_CONFIG_HOME/wgetrc"
set -gx PYTHON_HISTORY "$XDG_STATE_HOME/python_history"
set -gx MYSQL_HISTFILE "$XDG_DATA_HOME/mysql_history"
set -gx SQLITE_HISTORY "$XDG_DATA_HOME/sqlite_history"
set -gx TASKRC "$XDG_CONFIG_HOME/task/taskrc"
set -gx TASKDATA "$XDG_DATA_HOME/task"

set -gx FISHDIR "$XDG_CONFIG_HOME/fish"
set -gx TMUXDIR "$XDG_CONFIG_HOME/tmux"

# pyenv
set -gx PYENV_ROOT "$XDG_CONFIG_HOME/pyenv"
test -e $PYENV_ROOT
and set -ax fish_user_paths "$PYENV_ROOT/bin"
and pyenv init - | source

# nim
test -e "$HOME/.nimble"
and set -ax fish_user_paths "$HOME/.nimble/bin"

# go
set -gx GOROOT "/usr/local/share/go"
test -e "$GOROOT"
and set -ax fish_user_paths "$GOROOT/bin"
set -gx GOPATH "$XDG_DATA_HOME/go"
test -e "$GOPATH"
and set -ax fish_user_paths "$GOPATH/bin"

# vim
set -gx VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# nnn
set -gx NNN_OPTS "AdHio"
set -gx NNN_COLORS "#0b0a0c0d;3265"
set -gx NNN_FIFO "/tmp/nnn.fifo"
set -gx NNN_BMS "d:$HOME/Downloads;b:$XDG_DATA_HOME/bookmarks"
set -gx NNN_PLUG "p:preview-tui"

# local bin
set -ax fish_user_paths "$HOME/.local/bin"

switch (uname)
    case Linux
        # linux
        umask 022

        # WSL
        test (grep -i microsoft /proc/version)
        and set -x IS_WSL 1
        and set -gx NNN_OPENER "wsl-open"
        and set -gx NNN_BMS "d:/mnt/c/Users/$USER/Downloads;b:$XDG_DATA_HOME/bookmarks"
    case Darwin
        # mac
        set -gx LSCOLORS gxfxcxdxbxegedabagacad  # lsの色設定
end

set -x SET_ENV

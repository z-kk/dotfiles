# default zshrc
source "$ZDOTDIR/defaultrc.zsh"

# 設定を上書き
prompt default
HISTFILE="$XDG_STATE_HOME/zsh/history"

# ZI
typeset -Ag ZI
typeset -gx ZI[HOME_DIR]="$ZDOTDIR/zi"
typeset -gx ZI[BIN_DIR]="$ZDOTDIR/zi/bin"
source "$ZI[BIN_DIR]/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands

zi load zsh-users/zsh-syntax-highlighting
zi load zsh-users/zsh-autosuggestions
zi load zsh-users/zsh-completions

# theme
#zi snippet OMZL::git.zsh
#zi snippet OMZP::git
#zi snippet OMZL::theme-and-appearance.zsh
#zi snippet OMZL::prompt_info_functions.zsh
#zi snippet OMZT::agnoster
#zi snippet OMZT::lukerandall
zi snippet OMZT::steeef

RPROMPT="%F{magenta}"
# vim
if [ -n "$VIM" ]; then
    RPROMPT=$RPROMPT"vim"
fi

# nvim
if [ -n "$NVIM" ]; then
    RPROMPT=$RPROMPT" nvim"
fi

# yazi
if [ -n "$YAZI_LEVEL" ]; then
    if [ "$YAZI_LEVEL" -gt 1 ]; then
        RPROMPT=$RPROMPT" yazi[$YAZI_LEVEL]"
    else
        RPROMPT=$RPROMPT" yazi"
    fi
fi

# nnn
if [ -n "$NNNLVL" ]; then
    if [ "$NNNLVL" -gt 1 ]; then
        RPROMPT=$RPROMPT" nnn[$NNNLVL]"
    else
        RPROMPT=$RPROMPT" nnn"
    fi
fi

# alias
zi load momo-lab/zsh-abbrev-alias
source $ZDOTDIR/aliases.zsh
source $XDG_CONFIG_HOME/shell/functions.sh
if [ -x "$(command -v docker)" ]; then
    source <(docker completion zsh)
fi

# pyenv
if [ -e $PYENV_ROOT ]; then
    eval "$(pyenv init -)"
fi

# fzf
if [ -x "$(command -v fzf)" ]; then
    source <(fzf --zsh)
fi

# zoxide
if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi

# コマンドの訂正
setopt correct

# cd時にスタックに追加
setopt auto_pushd
setopt pushd_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

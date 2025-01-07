source "$ZDOTDIR/defaultrc.zsh"

HISTFILE="$XDG_STATE_HOME/zsh/history"

source $ZDOTDIR/aliases.zsh
source $XDG_CONFIG_HOME/shell/functions.sh
if [ -x "$(command -v docker)" ]; then
    source <(docker completion zsh)
fi

# pyenv
if [ -e $PYENV_ROOT ]; then
    eval "$(pyenv init -)"
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

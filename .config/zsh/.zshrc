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

# コマンドの訂正
setopt correct

# cd時にスタックに追加
setopt auto_pushd
setopt pushd_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

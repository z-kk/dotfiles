# OS共通
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

export EDITOR=vim

# linux
export PATH=$PATH:/sbin

# mac
# lsの色設定
export LSCOLORS=gxfxcxdxbxegedabagacad
# コマンドラインの色設定
PS1="\[\033[32m\]\u@\h\[\033[0m\]:\[\033[33m\]\w\[\033[0m\]\$ "

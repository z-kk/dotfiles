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

# cygwin
# デスクトップ, ドキュメントをマウント
if [ ! -d /desktop ]; then
	mount $(reg query "hkcu\software\microsoft\windows\currentversion\explorer\shell folders" | grep Desktop | awk '{ print $3 }' | sed s/\\\\/\\//g | sed s/\\r//) /desktop
fi
if [ ! -d /documents ]; then
	mount $(reg query "hkcu\software\microsoft\windows\currentversion\explorer\shell folders" | grep Personal | awk '{ print $3 }' | sed s/\\\\/\\//g | sed s/\\r//) /documents
fi

# mac
# lsの色設定
export LSCOLORS=gxfxcxdxbxegedabagacad
# コマンドラインの色設定
PS1="\[\033[32m\]\u@\h\[\033[0m\]:\[\033[33m\]\w\[\033[0m\]\$ "

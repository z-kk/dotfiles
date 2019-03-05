# OS共通
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

tabs 4
export EDITOR=vim

# linux
export PATH=$PATH:/sbin

if [ $OSTYPE = "linux*" ]; then
	# linux
	export PATH=$PATH:/sbin
elif [ $OSTYPE = "cygwin" ]; then
	# cygwin
	if [ -f ~/.gitprompt ]; then
		PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[36m\]$(__git_ps1 " (%s)")\[\e[0m\]\n\$ '
	fi
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
elif [ $OSTYPE = "darwin*" ]; then
	# mac
	# lsの色設定
	export LSCOLORS=gxfxcxdxbxegedabagacad
	# コマンドラインの色設定
	PS1="\[\033[32m\]\u@\h\[\033[0m\]:\[\033[33m\]\w\[\033[0m\]\$ "
fi

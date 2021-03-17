export EDITOR=vim
export LC_COLLATE=C  # lsの並び順
export XDG_CONFIG_HOME=$HOME/.config

# pyenv
if [ -e ~/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# nim
export PATH=$HOME/.nimble/bin:$PATH

if [[ $OSTYPE =~ linux ]]; then
    # linux
    umask 022
    export PATH=$PATH:/sbin
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

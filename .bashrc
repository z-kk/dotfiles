# OS共通
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

function plat(){
    platex $1.tex;
    platex $1.tex;
    dvipdfmx $1.dvi
}

export EDITOR=vim

# mac
alias ls='ls -ABGF'
alias grep='grep --color'

alias go='open'

# lsの色設定
export LSCOLORS=gxfxcxdxbxegedabagacad
# コマンドラインの色設定
PS1="\[\033[32m\]\u@\h\[\033[0m\]:\[\033[33m\]\w\[\033[0m\]\$ "

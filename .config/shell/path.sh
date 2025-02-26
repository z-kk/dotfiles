if [[ $READPATH ]]; then
    return
fi

export PATH="$PYENV_ROOT/bin:$PATH"
if [ -e $PYENV_ROOT ]; then
    eval "$(pyenv init --path)"
fi

export PATH="$DENO_INSTALL/bin:$PATH"

export PATH="$CARGO_HOME/bin:$PATH"

export PATH="$HOME/.nimble/bin:$PATH"

export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export READPATH=1

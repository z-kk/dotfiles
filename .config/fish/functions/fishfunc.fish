function fishfunc
    test -z "$argv[1]"
    and $EDITOR $XDG_CONFIG_HOME/fish/functions
    or $EDITOR $XDG_CONFIG_HOME/fish/functions/$argv[1]
end

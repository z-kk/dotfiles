function tmux
    test -e $XDG_CONFIG_HOME/tmux/tmux.conf
    and command tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf $argv
    or command tmux $argv
end


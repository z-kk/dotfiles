tabs 4

# wsltty
test $IS_WSL
and test (ps -o command= -p (string trim (ps -o ppid= -p $fish_pid)) | grep wsltty)
and set -x IS_WSLTTY 1

# fzf
type -q fzf
and fzf --fish | source

# zoxide
type -q zoxide
and zoxide init fish | source

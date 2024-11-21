tabs 4

# wsltty
test $IS_WSL
and test (ps -o command= -p (string trim (ps -o ppid= -p $fish_pid)) | grep wsltty)
and set -x IS_WSLTTY 1

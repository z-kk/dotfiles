abbr -a fishconf "$EDITOR $FISHDIR/config.fish"
abbr -a fishfunc "$EDITOR $FISHDIR/functions"

abbr -a pipython pipenv run python
abbr -a tmux command tmux -f "$TMUXDIR/tmux.conf"

# Vim
abbr -a vim8 vim -c '"e ++enc=utf-8"'
abbr -a jetpacksync vim -c JetpackSync
abbr -a simplenote vim -c SimplenoteList
abbr -a memolist vim -c MemoList

# Docker
abbr -a dcb docker compose build
abbr -a dcu docker compose up -d
abbr -a dcd docker compose down
abbr -a dce docker compose exec
abbr -a dcr docker compose run --rm
abbr -a dcl docker compose logs
abbr -a dcp docker compose ps

switch (uname)
    case Linux
        abbr -a logoff gnome-session-quit
        if test $IS_WSL
            alias open wslopen
            alias shutdown wslshutdown
        end
end

abbr -a fishconf "$EDITOR $FISHDIR/config.fish"
abbr -a fishfunc "$EDITOR $FISHDIR/functions"

abbr -a pipython pipenv run python
#abbr -a tmux command tmux -f "$TMUXDIR/tmux.conf"
abbr -a --set-cursor opensslenc openssl enc % -aes-256-cbc -pbkdf2 -salt -iter 99999 -k pass

abbr -a service sudo service
abbr -a mount sudo mount
abbr -a umount sudo umount
abbr -a apt sudo apt
abbr -a shutdown sudo shutdown

# Vim
abbr -a vim8 vim -c '"e ++enc=utf-8"'
abbr -a jetpacksync vim -c JetpackSync
abbr -a unite vim -c '"Unite menu"'
abbr -a simplenote vim -c SimplenoteList
abbr -a memolist vim -c MemoList

#Git
abbr -a gs git status -s
abbr -a gl git log --oneline
abbr -a gla git log --oneline --all --graph --date=short --pretty=format:"'%C(auto)%h %C(magenta)%cd%C(auto)%d %s %C(green)<%cn>'" -10
abbr -a gb git branch -a
abbr -a gc git checkout
abbr -a --set-cursor gcm git commit -m '"%"'
abbr -a gca git commit --amend --no-edit
abbr -a gd git diff
abbr -a gr git rebase
abbr -a grs git rebase --skip
abbr -a grc git rebase --continue

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
            abbr -e shutdown
            alias shutdown wslshutdown
        end
end

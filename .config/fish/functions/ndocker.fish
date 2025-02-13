function ndocker
    read -l -p'echo "docker compose command [up]: "' cmd
    and set cmd (string split " " "'$cmd'" | string trim -c "'")
    # default: docker compose up -d
    test -z $cmd[1]
    and set cmd "up" "-d"

    # check $HOME/docker dir exists
    set -l dir "$HOME/docker"
    test ! -d $dir
    and set dir

    for x in (command nnn -p - "$dir")
        test -d "$x"
        and set x "$x"/(command ls "$x" | grep docker-compose)
        test (string match "*docker-compose*" "$x")
        or continue
        docker compose -f "$x" $cmd
    end
end

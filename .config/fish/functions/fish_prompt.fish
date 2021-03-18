function fish_prompt
    set -l retc red
    test $status = 0; and set retc green

    set -q __fish_git_prompt_showupstream
    or set -g __fish_git_prompt_showupstream auto

    # local val
    set -l is_root "$USER" = root -o "$USER" = toor

    if test $is_root
        set_color -o red
    else
        set_color $fish_color_user
    end
    echo -n $USER
    set_color normal
    echo -n @
    if [ -z "$SSH_CLIENT" ]
        set_color $fish_color_host
    else
        set_color $fish_color_host_remote
    end
    echo -n (prompt_hostname)
    set_color normal
    echo -n :
    set_color $fish_color_cwd
    echo -n (prompt_pwd)

    # Virtual Environment
    set_color $retc
    set -q VIRTUAL_ENV
    and echo -n '['
    and echo -n (basename "$VIRTUAL_ENV")
    and echo -n ']'

    # git
    set prompt_git (__fish_git_prompt "(%s)")
    test -n "$prompt_git"
    and echo -n $prompt_git

    # New line
    if test (math $COLUMNS - (echo $USER (prompt_hostname) (prompt_pwd) | string length) \* 2) -lt 0
        echo
        set lined
    end

    # Background jobs
    set_color normal
    for job in (jobs)
        if not set -q lined
            echo
        end
        set_color $retc
        echo -n '│ '
        set_color brown
        echo $job
    end
    set -e lined
    set_color $retc
    if test $is_root
        echo -n '# '
    else
        echo -n '><>'
    end
    set_color normal
end

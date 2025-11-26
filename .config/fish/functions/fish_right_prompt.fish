function fish_right_prompt
    set_color $fish_color_env

    test -n "$VIM"
    and echo -n "vim"

    test -n "$NVIM"
    and echo -n " nvim"

    if test -n "$YAZI_LEVEL"
        test "$YAZI_LEVEL" -gt 1
        and echo -n " yazi[$YAZI_LEVEL]"
        or echo -n " yazi"
    end

    if test -n "$NNNLVL"
        test "$NNNLVL" -gt 1
        and echo -n " nnn[$NNNLVL]"
        or echo -n " nnn"
    end
end

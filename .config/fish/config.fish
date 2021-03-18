if not set -q profile
    set -x profile
    set -x SHELL (which fish)
    set -x fish_prompt_pwd_dir_length 0

    set -x EDITOR vim
    set -x LC_COLLATE C
    set -x XDG_CONFIG_HOME $HOME/.config

    test -n (grep Microsoft /proc/version)
    and set -x IS_WSL 1

    # pyenv
    test -e $HOME/.pyenv
    and set -x PYENV_ROOT $HOME/.pyenv
    and set -ax fish_user_paths $PYENV_ROOT/bin
    and pyenv init - | source

    # nim
    test -e $HOME/.nimble
    and set -ax fish_user_paths $HOME/.nimble/bin

    # git config
    set -l git_prompt_color 0ff
    #set -x __fish_git_prompt_show_informative_status
    #set -x __fish_git_prompt_showcolorhints
    #set -x __fish_git_prompt_char_stateseparator ''
    set -x ___fish_git_prompt_color_prefix (set_color $git_prompt_color)
    set -x ___fish_git_prompt_color_branch (set_color $git_prompt_color)
    set -x ___fish_git_prompt_color_suffix (set_color $git_prompt_color)
    set -x ___fish_git_prompt_color_suffix_done (set_color normal)
end

tabs 4

if test -n (grep "Microsoft" /proc/version)
    # WSL
    set -x IS_WSL 1
    source $XDG_CONFIG_HOME/fish/functions/wslfunctions.fish
end

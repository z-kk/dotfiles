set -l git_prompt_color 0ff
#set -x __fish_git_prompt_show_informative_status
#set -x __fish_git_prompt_showcolorhints
#set -x __fish_git_prompt_char_stateseparator ''
set -x ___fish_git_prompt_color_prefix (set_color $git_prompt_color)
set -x ___fish_git_prompt_color_branch (set_color $git_prompt_color)
set -x ___fish_git_prompt_color_suffix (set_color $git_prompt_color)
set -x ___fish_git_prompt_color_suffix_done (set_color normal)

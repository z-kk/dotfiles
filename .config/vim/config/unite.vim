let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.dotfiles = {}
let g:unite_source_menu_menus.dotfiles.description = "edit dotfiles"
let g:unite_source_menu_menus.dotfiles.file_candidates = [
      \  ["vimrc", $MYVIMRC],
      \  ["vim config", $XDG_CONFIG_HOME . "/vim/config"],
      \  ["shell config", $XDG_CONFIG_HOME . "/shell"],
      \  ["bash config", $XDG_CONFIG_HOME . "/bash"],
      \  ["zsh config", $XDG_CONFIG_HOME . "/zsh"],
      \  ["fish config", $XDG_CONFIG_HOME . "/fish"],
      \  ["XDG_CONFIG_HOME", $XDG_CONFIG_HOME],
      \]

packadd vim-jetpack
call jetpack#begin($XDG_CONFIG_HOME . "/vim")
Jetpack 'tani/vim-jetpack', {'opt': 1}
"let g:jetpack_download_method = 'curl'

Jetpack 'vim-jp/vimdoc-ja'
"Jetpack 'embear/vim-localvimrc'
"let g:localvimrc_persistent = 1
"let g:localvimrc_persistence_file = $XDG_DATA_HOME . "/localvimrc_persistent"

" Git
Jetpack 'tpope/vim-fugitive'
Jetpack 'benknoble/gitignore-vim'

" Simplenote
Jetpack 'simplenote-vim/simplenote.vim'
let g:SimplenoteUsername = ""

" Memolist
Jetpack 'glidenote/memolist.vim'
let g:memolist_path = $XDG_DATA_HOME . "/memo"
let g:memolist_memo_suffix = "md"

" colorscheme
Jetpack 'w0ng/vim-hybrid'
let g:hybrid_custom_term_colors = 1
Jetpack 'svjunic/RadicalGoodSpeed.vim'
Jetpack 'Haron-Prime/Antares'

" complement
Jetpack 'prabirshrestha/asyncomplete.vim'
Jetpack 'prabirshrestha/asyncomplete-file.vim'
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))

Jetpack 'akaimo/asyncomplete-around.vim'
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#around#get_source_options({
      \ 'name': 'around',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#around#completor'),
      \ }))

Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
Jetpack 'prabirshrestha/vim-lsp'
"let g:lsp_diagnostics_virtual_text_enabled = 0
"let g:lsp_diagnostics_echo_cursor = 1
Jetpack 'mattn/vim-lsp-settings'

" snippet
Jetpack 'garbas/vim-snipmate'
let g:snipMate = { 'snippet_version': 1 }
Jetpack 'MarcWeber/vim-addon-mw-utils'
Jetpack 'tomtom/tlib_vim'

" file utils
Jetpack 'Shougo/unite.vim'
Jetpack 'Shougo/unite-outline'

Jetpack 'lambdalisue/fern.vim'
let g:fern#default_hidden = 1
Jetpack 'lambdalisue/fern-git-status.vim'
Jetpack 'lambdalisue/vim-fern-hijack'
Jetpack 'lambdalisue/vim-fern-bookmark'
let g:fern#scheme#bookmark#store#file = $XDG_CONFIG_HOME . "/fern/bookmark.json"

Jetpack 'tyru/open-browser.vim'

Jetpack 'AndrewRadev/linediff.vim'

" filetype
Jetpack 'preservim/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
Jetpack 'mattn/vim-maketable'

Jetpack 'chrisbra/csv.vim', { 'for': 'csv' }
let g:csv_no_conceal = 1

Jetpack 'zah/nim.vim'
Jetpack 'dag/vim-fish'

call jetpack#end()

packadd! editorconfig

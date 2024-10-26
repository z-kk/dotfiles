packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1}
"let g:jetpack_download_method = 'curl'

Jetpack 'vim-jp/vimdoc-ja'

" Git
Jetpack 'tpope/vim-fugitive'
Jetpack 'benknoble/gitignore-vim'

" Simplenote
Jetpack 'simplenote-vim/simplenote.vim'
let g:SimplenoteUsername = ""

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
Jetpack 'mattn/vim-lsp-settings'

" snippet
Jetpack 'garbas/vim-snipmate'
let g:snipMate = { 'snippet_version': 1 }
Jetpack 'MarcWeber/vim-addon-mw-utils'
Jetpack 'tomtom/tlib_vim'

" file utils
Jetpack 'Shougo/unite.vim'
Jetpack 'Shougo/unite-outline'
command Outline Unite -vertical outline

Jetpack 'lambdalisue/fern.vim'
let g:fern#default_hidden = 1
Jetpack 'lambdalisue/fern-git-status.vim'

Jetpack 'AndrewRadev/linediff.vim'

" filetype
Jetpack 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

Jetpack 'chrisbra/csv.vim'
let g:csv_no_conceal = 1

Jetpack 'zah/nim.vim'
Jetpack 'dag/vim-fish'

call jetpack#end()

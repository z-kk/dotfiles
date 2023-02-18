packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1}
Jetpack 'vim-jp/vimdoc-ja'

" Git
Jetpack 'tpope/vim-fugitive'
Jetpack 'benknoble/gitignore-vim'

" colorscheme
Jetpack 'w0ng/vim-hybrid'

" complement
Jetpack 'prabirshrestha/asyncomplete.vim'
Jetpack 'prabirshrestha/asyncomplete-file.vim'
Jetpack 'akaimo/asyncomplete-around.vim'
Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
Jetpack 'prabirshrestha/vim-lsp'
Jetpack 'mattn/vim-lsp-settings'

" Unite
Jetpack 'Shougo/unite.vim'
Jetpack 'Shougo/unite-outline'

" filetype
Jetpack 'plasticboy/vim-markdown'
Jetpack 'zah/nim.vim'
Jetpack 'dag/vim-fish'

" other
Jetpack 'scrooloose/nerdtree'
Jetpack 'AndrewRadev/linediff.vim'

call jetpack#end()

" ---- vim-jetpack ----
"let g:jetpack_download_method = 'curl'

" ---- complement ----
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#around#get_source_options({
      \ 'name': 'around',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#around#completor'),
      \ }))

" ---- unite-outline ----
command Outline Unite -vertical outline

" ---- vim-markdown ----
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

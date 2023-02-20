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

" file utils
Jetpack 'Shougo/unite.vim'
Jetpack 'Shougo/unite-outline'
Jetpack 'scrooloose/nerdtree'
Jetpack 'Xuyuanp/nerdtree-git-plugin'
Jetpack 'AndrewRadev/linediff.vim'

" filetype
Jetpack 'plasticboy/vim-markdown'
Jetpack 'zah/nim.vim'
Jetpack 'dag/vim-fish'

call jetpack#end()

" ---- vim-jetpack ----
"let g:jetpack_download_method = 'curl'

" ---- complement ----
"let g:lsp_diagnostics_virtual_text_enabled = 0
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

" ---- NERDTree ----
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowHidden=1
if $IS_WSLTTY
  let NERDTreeDirArrowExpandable='+'
  let NERDTreeDirArrowCollapsible='-'
endif
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'M',
            \ 'Staged'    :'+',
            \ 'Untracked' :'A',
            \ 'Renamed'   :'R',
            \ 'Unmerged'  :'U',
            \ 'Deleted'   :'D',
            \ 'Dirty'     :'x',
            \ 'Ignored'   :'i',
            \ 'Clean'     :' ',
            \ 'Unknown'   :'?',
            \ }

" ---- vim-markdown ----
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1}
"let g:jetpack_download_method = 'curl'

Jetpack 'vim-jp/vimdoc-ja'

" Git
Jetpack 'tpope/vim-fugitive'
Jetpack 'benknoble/gitignore-vim'

" colorscheme
Jetpack 'w0ng/vim-hybrid'

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

" file utils
Jetpack 'Shougo/unite.vim'
Jetpack 'Shougo/unite-outline'
command Outline Unite -vertical outline

Jetpack 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
if $IS_WSLTTY
  let NERDTreeDirArrowExpandable='+'
  let NERDTreeDirArrowCollapsible='-'
endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

Jetpack 'Xuyuanp/nerdtree-git-plugin'
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

Jetpack 'AndrewRadev/linediff.vim'

" filetype
Jetpack 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

Jetpack 'zah/nim.vim'
Jetpack 'dag/vim-fish'

call jetpack#end()

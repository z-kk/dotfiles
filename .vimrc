set number
set cursorline
set showmatch

set incsearch
set nohlsearch
set ignorecase
set smartcase
set shortmess-=S
set wildmenu wildmode=full
set wildignorecase
set foldmethod=indent

if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:histogram,indent-heuristic
endif

" ---- indent ----
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=0
set autoindent
set smartindent
set expandtab
" 改行時自動コメントアウトしない
autocmd FileType * setlocal formatoptions-=ro

" ---- status line ----
set laststatus=2
set statusline=%<%F\ %m%r%h
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=[%v]\ %l/%L\ %P
set showcmd

set mouse=a
set backspace=indent,eol,start
set whichwrap=b,s
set scrolloff=4

" ---- encode ----
if &fenc !=# 'utf-8'
    set enc=utf-8
    set fenc=utf-8
    set fencs=ucs-bom,iso-2022-jp-3,iso-2022-jp,cp932,sjis,euc-jp,utf-8
endif

" ---- bash_aliases ----
let $OSTYPE = tolower(system('uname'))
"let $IS_WSL = system('uname -a')
let $BASH_ENV = "~/.bash_aliases"
autocmd BufNewFile,BufRead .bash_aliases setf sh
autocmd BufNewFile,BufRead .bash_functions setf sh

" ---- color scheme ----
autocmd colorscheme * highlight LineNr ctermfg=6
autocmd colorscheme * highlight CursorLine term=none cterm=none ctermbg=darkgray
autocmd colorscheme * highlight CursorLineNr ctermfg=3
colorscheme ron
syntax on

" ---- remap ----
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
cnoremap <C-r>, <C-r>"
noremap ; <C-w>
noremap , "

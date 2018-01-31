syntax on
colorscheme ron

set number
set cursorline
set showmatch

set incsearch
set nohlsearch
set ignorecase
set smartcase
set wildmode=longest,list
set foldmethod=indent

set tabstop=4
set shiftwidth=4
set softtabstop=0
set autoindent
set smartindent
set noexpandtab

set laststatus=2
set statusline=%<%F\ %m%r%h
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L\ %P
set showcmd

set mouse=a
set backspace=indent,eol,start
set whichwrap=b,s

if &fenc !=# 'utf-8'
	set enc=utf-8
	set fenc=utf-8
	set fencs=ucs-bom,iso-2022-jp-3,iso-2022-jp,cp932,sjis,euc-jp,utf-8
endif

" ---- bash_aliases ----
let $BASH_ENV = "~/.bash_aliases"
autocmd BufNewFile,BufRead .bash_aliases setf sh
autocmd BufNewFile,BufRead .bash_functions setf sh

highlight LineNr ctermfg=6
highlight CursorLine term=none cterm=none ctermbg=darkgray
highlight CursorLineNr ctermfg=3

noremap ; <C-w>

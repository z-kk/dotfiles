if has('vim_starting')
  set background=dark
  syntax on

  if has('vcon')
    set termguicolors
  endif

  if has('gui_running') || (&t_Co ?? 0) >= 256
    let g:hybrid_custom_term_colors = 1
    colorscheme hybrid
  else
    colorscheme ron
  endif
endif

if has('gui_running') || &termguicolors
  hi Comment guifg=#42935f
  hi Todo cterm=reverse gui=reverse

  hi DiffAdd guifg=NONE guibg=#002266
  hi DiffChange guifg=NONE guibg=#332266
  hi DiffDelete guibg=#101010
  hi DiffText guifg=NONE guibg=#551800

  hi clear SpecialKey
  hi link SpecialKey Special
elseif g:colors_name == 'hybrid'
  hi Normal ctermfg=250
  hi Comment ctermfg=28
  hi Constant ctermfg=201
  hi String ctermfg=208
  hi Statement ctermfg=40
  hi PreProc ctermfg=110
  hi Special ctermfg=181
  hi Todo cterm=reverse

  hi DiffAdd ctermfg=NONE ctermbg=18
  hi DiffChange ctermfg=NONE ctermbg=54
  hi DiffDelete ctermbg=236
  hi DiffText cterm=bold ctermfg=NONE ctermbg=52

  hi CursorLine ctermbg=17
  hi VertSplit ctermfg=152 ctermbg=236
  hi LineNr ctermfg=244
  hi Pmenu ctermfg=250 ctermbg=234
  hi PmenuSel ctermfg=250
  hi clear SpecialKey
  hi link SpecialKey Special
  hi StatusLine ctermfg=51 ctermbg=21 cterm=NONE
  hi StatusLineNC ctermfg=239
else
  hi Normal ctermfg=gray
  hi Comment ctermfg=darkgreen

  hi CursorLine ctermbg=darkblue
  hi CursorLineNr ctermbg=darkblue
endif

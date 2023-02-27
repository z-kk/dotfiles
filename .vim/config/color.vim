if has('vim_starting')
  set background=dark
  syntax on

  if has('vcon')
    set termguicolors
  endif

  let colorlist = map(split(globpath(&runtimepath, 'colors/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")')
  if index(colorlist, $VIMCOLOR) > -1
    colorscheme $VIMCOLOR
  elseif has('gui_running') && index(colorlist, 'hybrid') > -1
    colorscheme hybrid
  elseif (&t_Co ?? 0) >= 256 && index(colorlist, 'radicalgoodspeed') > -1
    colorscheme radicalgoodspeed
  else
    colorscheme ron
  endif
endif

if has('gui_running') || &termguicolors
  if g:colors_name == 'hybrid'
    hi Comment guifg=#42935f
    hi Todo cterm=reverse gui=reverse

    hi DiffAdd guifg=NONE guibg=#002266
    hi DiffChange guifg=NONE guibg=#332266
    hi DiffDelete guibg=#101010
    hi DiffText guifg=NONE guibg=#551800

    hi clear SpecialKey
    hi link SpecialKey Special
  endif
elseif g:colors_name == 'hybrid'
  hi Normal ctermfg=250
  hi Comment ctermfg=78
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
elseif g:colors_name == 'radicalgoodspeed'
  hi CursorLine ctermbg=17
  hi StatusLine ctermfg=233 ctermbg=45

  hi DiffAdd ctermfg=NONE
  hi DiffChange ctermfg=NONE ctermbg=18
  hi DiffText ctermfg=NONE

  hi Folded ctermfg=244
  hi Todo ctermbg=237
  hi Type ctermfg=135
  hi Keyword ctermfg=226
  hi Special ctermfg=111
  hi Error ctermfg=220

  hi htmlTagName ctermfg=226
  hi htmlArg ctermfg=213
elseif (&t_Co ?? 0) < 88
  hi Normal ctermfg=gray
  hi Comment ctermfg=darkgreen

  hi CursorLine ctermbg=darkblue
  hi CursorLineNr ctermbg=darkblue
endif

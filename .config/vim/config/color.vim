augroup ColorCmd
  autocmd!
  autocmd ColorScheme * call s:allcolorcmd()
  autocmd ColorScheme torte call s:tortecmd()
  autocmd ColorScheme hybrid call s:hybridcmd()
  autocmd ColorScheme radicalgoodspeed call s:radicalgoodspeedcmd()
  if (&t_Co ?? 0) < 88
    autocmd ColorSchemePre * call s:legacycolorcmd()
  endif
augroup END

function s:allcolorcmd()
  hi link FernRootText     Directory
  hi link FernBranchText   Directory

  if (has('termguicolors') && &termguicolors) || has('gui_running')
    let g:terminal_ansi_colors = ['#000000', '#d42c3a', '#1ca800', '#c0a800', '#005dff', '#b148c6', '#00a89a', '#bfbfbf', '#606060', '#ff7676', '#00f200', '#f2f200', '#7d97ff', '#ff70ff', '#00f0f0', '#ffffff']
    for i in range(g:terminal_ansi_colors->len())
      let g:terminal_color_{i} = g:terminal_ansi_colors[i]
    endfor
  endif

  if &background == 'dark'
    hi CursorLine ctermbg=17 guibg=#00005f
    hi Folded ctermbg=NONE guibg=NONE
  endif
endfunction

function s:tortecmd()
  if !g:usemycolor
    return
  endif

  hi StatusLine ctermfg=233 ctermbg=45 guifg=#0e1416 guibg=#00ccff
  hi StatusLineNC ctermfg=16 ctermbg=243 guifg=#000000 guibg=#767676
  hi VertSplit ctermfg=243 ctermbg=NONE guifg=#767676 guibg=NONE
  hi FloatBorder ctermfg=129 guifg=#af00ff

  hi Visual ctermfg=0 ctermbg=81 guifg=#000000 guibg=#5fd7ff
  hi Constant ctermfg=154 guifg=#afff00
  hi String ctermfg=41 guifg=#00d75f
  hi Function ctermfg=147 guifg=#afafff

  hi DiffAdd ctermfg=NONE ctermbg=235 guifg=NONE guibg=#262626
  hi DiffChange ctermfg=NONE ctermbg=18 guifg=NONE guibg=#000087
  hi DiffText ctermfg=NONE ctermbg=90 guifg=NONE guibg=#870087
  hi DiffDelete cterm=reverse ctermfg=234 ctermbg=133 gui=reverse guifg=#1c1c1c guibg=#af5faf
endfunction

function s:hybridcmd()
  if !g:usemycolor
    return
  endif

  if &background == 'dark'
    hi Normal ctermfg=250
    hi Comment ctermfg=78 guifg=#42935f
    hi Constant ctermfg=201
    hi String ctermfg=208
    hi Statement ctermfg=40
    hi PreProc ctermfg=110
    hi Special ctermfg=181
    hi Todo cterm=reverse gui=reverse

    hi DiffAdd ctermfg=NONE ctermbg=18 guifg=NONE guibg=#002266
    hi DiffChange ctermfg=NONE ctermbg=54 guifg=NONE guibg=#332266
    hi DiffDelete ctermbg=236 guibg=#101010
    hi DiffText cterm=bold ctermfg=NONE ctermbg=52 guifg=NONE guibg=#551800

    hi VertSplit ctermfg=152 ctermbg=236
    hi LineNr ctermfg=244
    hi Pmenu ctermfg=250 ctermbg=234
    hi PmenuSel ctermfg=250
    hi clear SpecialKey
    hi link SpecialKey Special
    hi StatusLine ctermfg=51 ctermbg=21 cterm=NONE
    hi StatusLineNC ctermfg=239
  elseif &background == 'light'
    hi Todo cterm=reverse gui=reverse

    hi DiffAdd guifg=NONE
    hi DiffChange guifg=NONE
    hi DiffDelete guifg=NONE
    hi DiffText guifg=NONE guibg=#c0c0ee

    hi Folded guibg=NONE
  endif
endfunction

function s:radicalgoodspeedcmd()
  if !g:usemycolor
    return
  endif

  hi StatusLine ctermfg=233 ctermbg=45 guifg=#0e1416 guibg=#00ccff

  hi Pmenu ctermfg=15 ctermbg=60 guibg=#666666 guifg=#eeeeec
  hi PmenuSel ctermfg=0 ctermbg=214 guibg=#fcaf3e guifg=#000000

  hi DiffAdd ctermfg=NONE guifg=NONE
  hi DiffChange ctermfg=NONE ctermbg=18 guifg=NONE guibg=#204a87
  hi DiffText ctermfg=NONE guifg=NONE

  hi Folded ctermfg=244 guifg=#ae5ff2 guibg=NONE
  hi Todo ctermbg=237 guibg=#696969
  hi Directory ctermfg=75 guifg=#729fcf
  hi Type ctermfg=135 guifg=#ae5ff2
  hi Keyword ctermfg=226 guifg=#fff847
  hi Special ctermfg=111 guifg=#7fa7f8
  hi Error ctermfg=220 guifg=#f9d749

  hi htmlTagName ctermfg=226 guifg=#fff847
  hi htmlArg ctermfg=213 guifg=#ff88ee
endfunction

function s:legacycolorcmd()
  if !g:usemycolor
    return
  endif

  hi Normal ctermfg=gray
  hi Comment ctermfg=darkgreen

  hi CursorLine ctermbg=darkblue
  hi CursorLineNr ctermbg=darkblue
endfunction

set background=dark
syntax on

if has('vcon')
  set termguicolors
endif

let g:usemycolor = 1
let colorlist = map(split(globpath(&runtimepath, 'colors/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")')
if index(colorlist, $VIMCOLOR) > -1
  colorscheme $VIMCOLOR
elseif has('gui_running')
  set background=light
  colorscheme wildcharm
else
  colorscheme torte
endif

command SynName echo synIDattr(synID(line('.'), col('.'), 1), 'name')
command SynNameTrans echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

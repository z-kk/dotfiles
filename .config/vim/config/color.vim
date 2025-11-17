augroup ColorCmd
  autocmd!
  autocmd ColorScheme * {
    hi link FernRootText     Directory
    hi link FernBranchText   Directory
  }
  autocmd ColorScheme hybrid {
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

      hi CursorLine ctermbg=17
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
  }
  autocmd ColorScheme radicalgoodspeed {
    hi CursorLine ctermbg=17 guibg=#000066
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
  }
  if (&t_Co ?? 0) < 88
    autocmd ColorSchemePre * {
      hi Normal ctermfg=gray
      hi Comment ctermfg=darkgreen

      hi CursorLine ctermbg=darkblue
      hi CursorLineNr ctermbg=darkblue
    }
  endif
augroup END

set background=dark
syntax on

if has('vcon')
  set termguicolors
endif

let colorlist = map(split(globpath(&runtimepath, 'colors/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")')
if index(colorlist, $VIMCOLOR) > -1
  colorscheme $VIMCOLOR
elseif has('gui_running') && index(colorlist, 'hybrid') > -1
  set background=light
  colorscheme hybrid
elseif (&t_Co ?? 0) >= 256 && index(colorlist, 'radicalgoodspeed') > -1
  colorscheme radicalgoodspeed
else
  colorscheme ron
endif

command SynName echo synIDattr(synID(line('.'), col('.'), 1), 'name')
command SynNameTrans echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

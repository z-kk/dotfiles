colorCmdGrp = vim.api.nvim_create_augroup('ColorCmd', {})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = colorCmdGrp,
  callback = function()
    vim.cmd("hi link FernRootText Directory")
    vim.cmd("hi link FernBranchText Directory")
  end
})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = colorCmdGrp,
  pattern = "radicalgoodspeed",
  callback = function()
    vim.cmd("hi CursorLine ctermbg=17 guibg=#000066")
    vim.cmd("hi StatusLine ctermfg=233 ctermbg=45 guifg=#0e1416 guibg=#00ccff")

    vim.cmd("hi Pmenu ctermfg=15 ctermbg=60 guibg=#666666 guifg=#eeeeec")
    vim.cmd("hi PmenuSel ctermfg=0 ctermbg=214 guibg=#fcaf3e guifg=#000000")

    vim.cmd("hi DiffAdd ctermfg=NONE guifg=NONE")
    vim.cmd("hi DiffChange ctermfg=NONE ctermbg=18 guifg=NONE guibg=#204a87")
    vim.cmd("hi DiffText ctermfg=NONE guifg=NONE")

    vim.cmd("hi Folded ctermbg=NONE guifg=#ae5ff2 guibg=NONE")
    vim.cmd("hi Todo ctermbg=237 guibg=#696969")
    vim.cmd("hi Directory ctermfg=75 guifg=#729fcf")
    vim.cmd("hi Type ctermfg=135 guifg=#ae5ff2")
    vim.cmd("hi Keyword ctermfg=226 guifg=#fff847")
    vim.cmd("hi Special ctermfg=111 guifg=#7fa7f8")
    vim.cmd("hi Error ctermfg=220 guifg=#f9d749")

    vim.cmd("hi htmlTagName ctermfg=226 guifg=#fff847")
    vim.cmd("hi htmlArg ctermfg=213 guifg=#ff88ee")

    vim.cmd("hi @org.leading_stars ctermfg=0 guifg=#000000")
    vim.cmd("hi @org.agenda.scheduled ctermfg=10 guifg=#22f232")
    vim.cmd("hi @org.keyword.face.HOLD ctermfg=222 guifg=#ffca33")
    vim.cmd("hi @org.keyword.face.WAIT ctermfg=blue guifg=#2f8fff")
    vim.cmd("hi @org.keyword.face.IDEA ctermfg=cyan guifg=cyan")
    vim.cmd("hi @org.keyword.done cterm=bold ctermfg=2 gui=bold guifg=#1f9f30")
    vim.cmd("hi link @org.agenda.day Statement")
    vim.cmd("hi link @org.agenda.tag @org.bold")
    vim.cmd("hi link @org.agenda.today @org.bold")
    vim.cmd("hi link @org.agenda.weekend @org.bold")
    vim.cmd("hi link @org.agenda.header Comment")
    vim.cmd("hi link @org.agenda.separator Comment")
  end
})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = colorCmdGrp,
  pattern = "hybrid",
  callback = function()
    if vim.o.background == "dark" then
      vim.cmd("hi Normal ctermfg=250")
      vim.cmd("hi Comment ctermfg=78 guifg=#42935f")
      vim.cmd("hi Constant ctermfg=201")
      vim.cmd("hi String ctermfg=208")
      vim.cmd("hi Statement ctermfg=40")
      vim.cmd("hi PreProc ctermfg=110")
      vim.cmd("hi Special ctermfg=181")
      vim.cmd("hi Todo cterm=reverse gui=reverse")

      vim.cmd("hi DiffAdd ctermfg=NONE ctermbg=18 guifg=NONE guibg=#002266")
      vim.cmd("hi DiffChange ctermfg=NONE ctermbg=54 guifg=NONE guibg=#332266")
      vim.cmd("hi DiffDelete ctermbg=236 guibg=#101010")
      vim.cmd("hi DiffText cterm=bold ctermfg=NONE ctermbg=52 guifg=NONE guibg=#551800")

      vim.cmd("hi CursorLine ctermbg=17")
      vim.cmd("hi VertSplit ctermfg=152 ctermbg=236")
      vim.cmd("hi LineNr ctermfg=244")
      vim.cmd("hi Pmenu ctermfg=250 ctermbg=234")
      vim.cmd("hi PmenuSel ctermfg=250")
      vim.cmd("hi clear SpecialKey")
      vim.cmd("hi link SpecialKey Special")
      vim.cmd("hi StatusLine ctermfg=51 ctermbg=21 cterm=NONE")
      vim.cmd("hi StatusLineNC ctermfg=239")
    elseif vim.o.background == "light" then
      vim.cmd("hi Todo cterm=reverse gui=reverse")

      vim.cmd("hi DiffAdd guifg=NONE")
      vim.cmd("hi DiffChange guifg=NONE")
      vim.cmd("hi DiffDelete guifg=NONE")
      vim.cmd("hi DiffText guifg=NONE guibg=#c0c0ee")

      vim.cmd("hi Folded guibg=NONE")
    end
  end
})

vim.opt.background = "dark"

if vim.fn.has('vcon') == 1 then
  vim.opt.termguicolors = true
end

function color_exists(name)
  if name == nil then
    return false
  else
    return #vim.fn.globpath(vim.o.rtp, "colors/" .. name .. ".*") > 0
  end
end
if color_exists(vim.env.VIMCOLOR) then
  vim.cmd("colorscheme $VIMCOLOR")
elseif vim.fn.has("gui_running") == 1 and color_exists("hybrid") then
  vim.opt.background = "light"
  vim.cmd("colorscheme hybrid")
elseif color_exists("radicalgoodspeed") then
  vim.cmd("colorscheme radicalgoodspeed")
else
  vim.cmd("colorscheme ron")
end

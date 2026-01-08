colorCmdGrp = vim.api.nvim_create_augroup('ColorCmd', {})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = colorCmdGrp,
  callback = function()
    vim.cmd("hi link FernRootText Directory")
    vim.cmd("hi link FernBranchText Directory")
    vim.cmd("hi link @org.agenda.day Statement")
    vim.cmd("hi link @org.agenda.tag @org.bold")
    vim.cmd("hi link @org.agenda.today @org.bold")
    vim.cmd("hi link @org.agenda.weekend @org.bold")
    vim.cmd("hi link @org.agenda.header Comment")
    vim.cmd("hi link @org.agenda.separator Comment")

    if (vim.fn.has('termguicolors') and vim.o.termguicolors or vim.fn.has('gui_running')) then
      -- helmholtz term color
      local term_ansi_colors = {
        '#000000', '#d42c3a', '#1ca800', '#c0a800', '#005dff', '#b148c6', '#00a89a', '#bfbfbf',
        '#606060', '#ff7676', '#00f200', '#f2f200', '#7d97ff', '#ff70ff', '#00f0f0', '#ffffff',
      }
      for i, color in ipairs(term_ansi_colors) do
        vim.g["terminal_color_" .. (i - 1)] = color
      end
    end
    local title_colors = {
      { cfg = 68,  cbg = 254, gfg = "#4a86d4", gbg="#d6e6ff" },
      { cfg = 172, cbg = 254, gfg = "#cc8400", gbg="#ffe0af" },
      { cfg = 100, cbg = 254, gfg = "#8a8a00", gbg="#fff9c8" },
      { cfg = 127, cbg = 254, gfg = "#b800b8", gbg="#f6ddf6" },
      { cfg = 65,  cbg = 254, gfg = "#5f8f3a", gbg="#ddeecc" },
      { cfg = 97,  cbg = 254, gfg = "#7e64b8", gbg="#ddd3f3" },
      { cfg = 36,  cbg = 254, gfg = "#159b82", gbg="#cfede7" },
      { cfg = 140, cbg = 254, gfg = "#9a7fd6", gbg="#e2d8ff" },
    }

    if vim.o.background == "dark" then
      title_colors = {
        { cfg = 75,  cbg = 236, gfg = "#5fa5ff", gbg = "#1f2a3d" },
        { cfg = 214, cbg = 236, gfg = "#ffa500", gbg = "#332400" },
        { cfg = 227, cbg = 236, gfg = "#e6e660", gbg = "#3a3a14" },
        { cfg = 201, cbg = 236, gfg = "#ff00ff", gbg = "#2a1c2a" },
        { cfg = 119, cbg = 236, gfg = "#9fcb71", gbg = "#202a18" },
        { cfg = 141, cbg = 236, gfg = "#b89af0", gbg = "#241d33" },
        { cfg = 41,  cbg = 236, gfg = "#19bc9c", gbg = "#0e2a25" },
        { cfg = 104, cbg = 236, gfg = "#9b7dd4", gbg = "#201a2e" },
      }

      vim.cmd("hi CursorLine ctermbg=17 guibg=#00005f")
      vim.cmd("hi Folded ctermbg=NONE guibg=NONE")

      vim.cmd("hi @org.leading_stars ctermfg=0 guifg=#000000")
      vim.cmd("hi @org.agenda.scheduled ctermfg=10 guifg=#22f232")
      vim.cmd("hi @org.keyword.face.HOLD ctermfg=222 guifg=#ffca33")
      vim.cmd("hi @org.keyword.face.WAIT ctermfg=blue guifg=#2f8fff")
      vim.cmd("hi @org.keyword.face.IDEA ctermfg=cyan guifg=cyan")
      vim.cmd("hi @org.keyword.done cterm=bold ctermfg=2 gui=bold guifg=#1f9f30")
    end

    for i = 1, 8 do
      local tc = title_colors[i]
      vim.api.nvim_set_hl(0, "@markup.heading." .. i, { fg = tc["gfg"], ctermfg = tc["cfg"] })
      vim.api.nvim_set_hl(0, "@org.headline.level" .. i, { fg = tc["gfg"], ctermfg = tc["cfg"] })
      vim.api.nvim_set_hl(0, "RenderMarkdownH" .. i, { fg = tc["gfg"], ctermfg = tc["cfg"] })
      vim.api.nvim_set_hl(0, "RenderMarkdownH" .. i .. "Bg", { bg = tc["gbg"], ctermbg = tc["cbg"] })
    end
  end
})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = colorCmdGrp,
  pattern = "torte",
  callback = function()
    if vim.g.usemycolor ~= 1 then
      return
    end
    vim.cmd("hi StatusLine ctermfg=233 ctermbg=45 guifg=#0e1416 guibg=#00ccff")
    vim.cmd("hi StatusLineNC ctermfg=16 ctermbg=243 guifg=#000000 guibg=#767676")
    vim.cmd("hi VertSplit ctermfg=243 ctermbg=NONE guifg=#767676 guibg=NONE")
    vim.cmd("hi FloatBorder ctermfg=129 guifg=#af00ff")

    vim.cmd("hi Visual ctermfg=NONE ctermbg=129 guifg=NONE guibg=#9529F4")
    vim.cmd("hi WarningMsg ctermfg=226 guifg=#ffff00")
    vim.cmd("hi Constant ctermfg=154 guifg=#afff00")
    vim.cmd("hi String ctermfg=41 guifg=#00d75f")
    vim.cmd("hi Function ctermfg=147 guifg=#afafff")

    vim.cmd("hi DiffAdd ctermfg=NONE ctermbg=235 guifg=NONE guibg=#262626")
    vim.cmd("hi DiffChange ctermfg=NONE ctermbg=18 guifg=NONE guibg=#000087")
    vim.cmd("hi DiffText ctermfg=NONE ctermbg=90 guifg=NONE guibg=#870087")
    vim.cmd("hi DiffDelete cterm=reverse ctermfg=234 ctermbg=133 gui=reverse guifg=#1c1c1c guibg=#af5faf")

    vim.cmd("hi NeogitDiffAdd guifg=#5faf5f guibg=#003f20")
    vim.cmd("hi NeogitDiffAddHighlight guifg=#d7ff5f guibg=#1c5f20")
    vim.cmd("hi NeogitDiffAddCursor guifg=#d7ff5f guibg=#050505")
    vim.cmd("hi NeogitDiffDelete guifg=#d1d1d1 guibg=#5f0000")
    vim.cmd("hi NeogitDiffDeleteHighlight guifg=#ffffff guibg=#871c1c")
    vim.cmd("hi NeogitDiffDeleteCursor guifg=#ffffff guibg=#050505")
    vim.cmd("hi NeogitHunkHeaderHighlight guifg=#000000 guibg=#d78700")
    vim.cmd("hi NeogitHunkHeaderCursor guifg=#000000 guibg=#d78700")
  end
})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = colorCmdGrp,
  pattern = "radicalgoodspeed",
  callback = function()
    if vim.g.usemycolor ~= 1 then
      return
    end
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
  end
})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = colorCmdGrp,
  pattern = "hybrid",
  callback = function()
    if vim.g.usemycolor ~= 1 then
      return
    end
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

vim.g.usemycolor = 1
function color_exists(name)
  if name == nil then
    return false
  else
    return #vim.fn.globpath(vim.o.rtp, "colors/" .. name .. ".*") > 0
  end
end
if color_exists(vim.env.VIMCOLOR) then
  vim.cmd.colorscheme("$VIMCOLOR")
elseif vim.fn.has("gui_running") == 1 then
  vim.opt.background = "light"
  vim.cmd.colorscheme("wildcharm")
else
  vim.cmd.colorscheme("torte")
end

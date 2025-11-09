local opt = vim.opt

opt.number = true
opt.cursorline = true
opt.showmatch = true

opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.completeopt = "fuzzy,popup,menuone,noinsert"
if vim.fn.has('patch-9.1.0684') == 1 then
  opt.completeopt:append("noselect")
end
opt.wildmenu = true
opt.wildmode = "full"
opt.wildignorecase = true
opt.diffopt:append("internal,algorithm:histogram,indent-heuristic")

if vim.fn.has('patch-9.1.1819') == 1 then
  opt.foldcolumn = "1"
  opt.fillchars = { foldsep = " ", foldinner = " ", foldopen = "v", foldclose = ">" }
end

-- status line --
opt.laststatus = 2
opt.statusline = "%<%F %m%r%h"
opt.statusline:append("%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}")
opt.statusline:append("%=[%v] %l/%L %P")
opt.showcmd = true

opt.mouse = "a"
opt.backspace = "indent,eol,start"
opt.whichwrap = "b,s"
opt.scrolloff = 4

-- encode --
if vim.bo.fileencoding ~= "utf-8" then
  opt.enc = "utf-8"
  opt.fenc = "utf-8"
  opt.fencs = "ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,cp932,sjis,euc-jp"
end

-- terminal --
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- cursor --
opt.guicursor:append("a:blinkon500-blinkoff500")

-- XDG --
if vim.env.XDG_CONFIG_HOME == nil then
  vim.env.XDG_CONFIG_HOME = vim.env.HOME .. "/.config"
end
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
  if vim.env.XDG_CACHE_HOME == nil then
    vim.env.XDG_CACHE_HOME = vim.env.APPDATA
  end
  if vim.env.XDG_DATA_HOME == nil then
    vim.env.XDG_DATA_HOME = vim.env.LOCALAPPDATA
  end
end
opt.runtimepath:prepend(vim.env.XDG_CONFIG_HOME .. "/vim")

-- posh --
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
  opt.shell = "pwsh.exe"
  opt.shellcmdflag = "-c"
  opt.shellquote = ""
  opt.shellxquote = ""
end

-- font --
opt.guifont = "Bizin Gothic NF:h12"

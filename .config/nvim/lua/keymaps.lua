local map = vim.keymap

map.set('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
map.set('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

map.set('', ';', '<C-w>', { remap = true })

-- ToggleTerm --
vim.api.nvim_create_autocmd('TermEnter', {
  pattern = {'term://*toggleterm#*'},
  callback = function()
    map.set('t', '<C-t>', '<cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true })
  end,
})
map.set('n', '<C-t>', '<cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true })

-- Git --
map.set('', '<Leader>g', '<cmd>Neogit<CR>')

-- Memolist --
map.set('n', '<Leader>mn', '<cmd>MemoNew<CR>')
map.set('n', '<Leader>ml', '<cmd>MemoList<CR>')
map.set('n', '<Leader>mg', '<cmd>MemoGrep<CR>')

-- Fern --
map.set('', '<Leader>fn', '<cmd>Fern .<CR>')
map.set('', '<Leader>ff', '<cmd>Fern . -reveal=%<CR>')
map.set('', '<Leader>fd', '<cmd>Fern . -reveal=% -drawer -toggle<CR>')
map.set('', '<Leader>fh', '<cmd>Fern %:h -reveal=%<CR>')
map.set('', '<Leader>fb', '<cmd>Fern bookmark:///<CR>')
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'fern'},
  callback = function()
    local opts = { buffer = true, remap = true }
    map.set('n', 'p', 'P', opts)
    map.set('n', 'Y', 'C', opts)
    map.set('n', 'o', 'y:!open \'<C-r>"\'<CR><CR>', opts)
    map.set('n', '[', '<Plug>(fern-action-cd:root)', opts)
    map.set('n', ']', '<Plug>(fern-action-cd:cursor)', opts)
    map.set('n', 'fp', '<Plug>(fern-action-preview:auto:enable)<Plug>(fern-action-preview:open)', opts)
    map.set('n', 'fq', '<Plug>(fern-action-preview:auto:disable)<Plug>(fern-action-preview:close)', opts)
  end,
})

-- Telescope --
map.set('n', '<Leader>tl', '<cmd>Telescope live_grep<CR>')
map.set('n', '<Leader>tb', '<cmd>Telescope buffers<CR><Esc>')
map.set('n', '<Leader>tr', '<cmd>Telescope resume<CR><Esc>')
map.set('n', '<Leader>ty', 'yiw<cmd>Telescope live_grep<CR><C-r>"<Esc>')

map.set('', '<Leader>y', '<cmd>Yazi<CR>')
map.set('', '<Leader>n', '<cmd>NnnPicker<CR>')

-- Org --
map.set('', '<Leader>eo', '<cmd>edit $XDG_DATA_HOME/org<CR>')

-- Snippet --
map.set({'i', 's'}, '<C-j>', 'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-j>"', { expr = true })
map.set({'i', 's'}, '<C-k>', 'luasnip#choice_active() ? "<Plug>luasnip-prev-choice" : "<C-k>"', { expr = true })
map.set('n', '<Leader>ss', require('luasnip.loaders').edit_snippet_files, { desc = "Edit snippets" })

-- Lsp --
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Attach key mappings for LSP function",
  callback = function()
    map.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    map.set('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')
    map.set('n', 'gr', '<cmd>Telescope lsp_references<CR>')
  end,
})

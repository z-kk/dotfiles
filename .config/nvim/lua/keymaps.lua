local map = vim.keymap

map.set('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
map.set('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

map.set('', ';', '<C-w>')

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

map.set('', '<Leader>y', '<cmd>Yazi<CR>')
map.set('', '<Leader>n', '<cmd>NnnPicker<CR>')

-- Org --
map.set('', '<Leader>eo', '<cmd>edit $XDG_DATA_HOME/org<CR>')

map.set('n', '<Leader>ss', require('luasnip.loaders').edit_snippet_files, { desc = "Edit snippets" })
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Attach key mappings for LSP function",
  callback = function()
    map.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    map.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map.set('n', 'ge', '<cmd>lua vim.lsp.diagnostic.open_float()<CR>')
    map.set('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map.set('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  end,
})

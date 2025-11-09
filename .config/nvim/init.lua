require('options')
require('plugins')
--require('lsp')
require('colors')
require('indent')
require('keymaps')
vim.cmd('runtime! config/optional.vim')

vim.api.nvim_create_user_command('Reload', function()
  package.loaded['options'] = nil
  package.loaded['plugins'] = nil
  package.loaded['lsp'] = nil
  package.loaded['colors'] = nil
  package.loaded['indent'] = nil
  package.loaded['keymaps'] = nil

  require('options')
  require('plugins')
  --require('lsp')
  require('colors')
  require('indent')
  require('keymaps')
  vim.cmd('runtime! config/optional.vim')
end, {})

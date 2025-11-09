-- install vim-jetpack --
local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd('packadd vim-jetpack')
require('jetpack.paq') {
  {'tani/vim-jetpack', opt = true, config = function()
    --vim.g.jetpack_download_method = 'curl'
  end},

  {'vim-jp/vimdoc-ja'},
  {'vim-jp/nvimdoc-ja'},
  --{'embear/vim-localvimrc', config = function()
  --  vim.g.localvimrc_persistent = 1
  --  vim.g.localvimrc_persistence_file = vim.env.XDG_DATA_HOME .. "/localvimrc_persistent"
  --end},

  -- Git --
  {'tpope/vim-fugitive'},
  {'benknoble/gitignore-vim'},
  {'NeogitOrg/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      if vim.fn.has('vcon') ~= 1 then
        vim.api.nvim_create_autocmd('BufEnter', {
          pattern = {'Neogit*'},
          callback = function()
            vim.opt.termguicolors = true
          end,
        })
        vim.api.nvim_create_autocmd('BufLeave', {
          pattern = {'Neogit*'},
          callback = function()
            vim.opt.termguicolors = false
          end,
        })
      end
    end,
  },

  -- Simplenote --
  {'simplenote-vim/simplenote.vim',
    run = function()
      if vim.fn.executable('pip') == 1 then
        vim.cmd('!pip install pynvim')
      else
        print('Simplenote.vim requires pip install pynvim')
      end
    end,
    config = function()
      vim.g.SimplenoteUsername = ""
    end,
  },

  -- Memolist --
  {'glidenote/memolist.vim', config = function()
    vim.g.memolist_path = vim.env.XDG_DATA_HOME .. "/memo"
    vim.g.memolist_memo_suffix = "md"
  end},

  -- colorscheme --
  {'w0ng/vim-hybrid', config = function()
    vim.g.hybrid_custom_term_colors = 1
  end},
  {'svjunic/RadicalGoodSpeed.vim'},
  {'Haron-Prime/Antares'},

  {'uga-rosa/ccc.nvim', config = function()
    require('ccc').setup()
  end},

  -- complement --
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.opt.foldtext = ''
    end,
  },
  {'neovim/nvim-lspconfig', config = function()
    local servers = {}
    if vim.fn.executable('clangd') == 1 then table.insert(servers, "clangd") end
    if vim.fn.executable('nimlsp') == 1 then table.insert(servers, "nimls") end
    if vim.fn.executable('pylsp') == 1 then table.insert(servers, "pylsp") end
    vim.lsp.enable(servers)
  end},
  {'mason-org/mason.nvim', config = function()
    require('mason').setup()
  end},
  {'mason-org/mason-lspconfig.nvim', config = function()
    local servers = {}
    require('mason-lspconfig').setup({
      ensure_installed = servers,
    })
    vim.lsp.enable(servers)
  end},

  {'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        }, {
          { name = 'path' },
          { name = 'buffer' },
        }),
        mapping = {
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        },
      })
      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      })
    end
  },

  -- file utils --
  {'lambdalisue/fern.vim', config = function()
    vim.g['fern#default_hidden'] = 1
  end},
  {'lambdalisue/vim-fern-renderer-nerdfont',
    requires = {
      'lambdalisue/nerdfont.vim',
      'lambdalisue/vim-glyph-palette',
    },
    config = function()
      vim.g['fern#renderer'] = "nerdfont"
    end,
  },
  {'lambdalisue/fern-git-status.vim'},
  {'lambdalisue/vim-fern-hijack'},
  {'lambdalisue/vim-fern-bookmark', config = function()
    vim.g['fern#scheme#bookmark#store#file'] = vim.env.XDG_CONFIG_HOME .. '/fern/bookmark.json'
  end},

  {'mikavilpas/yazi.nvim'},
  {'luukvbaal/nnn.nvim', config = function()
    require('nnn').setup()
  end},

  {'AndrewRadev/linediff.vim'},
  {'will133/vim-dirdiff'},

  -- file type --
  {'nvim-orgmode/orgmode', ft = { 'org' }, config = function()
    require('orgmode').setup({
      org_agenda_files = vim.env.XDG_DATA_HOME .. "/org/**/*",
      org_default_notes_file = vim.env.XDG_DATA_HOME .. "/org/note.org",
      org_todo_keywords = { "TODO(t)", "HOLD", "WAIT", "IDEA", "|", "DONE", "KILL" },
      org_todo_keyword_faces = {
        HOLD = ':foreground 222',
        WAIT = ':foreground blue',
        IDEA = ':foreground cyan',
        KILL = ':foreground gray',
      },
      org_startup_indented = true,
      calendar_week_start_day = 0,
      org_agenda_start_on_weekday = false,
      org_agenda_custom_commands = {
        n = {
          description = 'Agenda and TODO list',
          types = {
            { type = 'agenda' },
            {
              type = 'tags_todo',
              org_agenda_sorting_strategy = {'priority-down', 'todo-state-up', 'category-keep'},
            },
          },
        },
      },
      org_agenda_sorting_strategy = {
        todo = {'priority-down', 'todo-state-up', 'category-keep'},
      },
      org_agenda_skip_scheduled_if_done = true,
      org_agenda_skip_deadline_if_done = true,
      org_tags_column = 0,
    })
  end},

  {'MeanderingProgrammer/render-markdown.nvim', config = function()
    require('render-markdown').setup({
      code = {
        language = false,
        width = 'block',
        left_pad = 2,
        right_pad = 2,
        border = 'thin',
        style = 'language',
      },
    })
  end},
  {'Nedra1998/nvim-mdlink', config = function()
    require('nvim-mdlink').setup()
  end},
  {'mattn/vim-maketable'},

  {'chrisbra/csv.vim', ft = { 'csv' }, config = function()
    vim.g.csv_no_conceal = 1
  end},
}

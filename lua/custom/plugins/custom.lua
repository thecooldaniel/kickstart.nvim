return {
  -- AutoSession
  {
    'rmagatti/auto-session',

    config = function()
      local function close_neotree()
        local neotree = require 'neo-tree.command'
        neotree.execute { action = 'close' }
      end
      require('auto-session').setup {
        log_level = 'error',
        auto_restore_enabled = true,
        auto_session_enabled = true,
        -- pre_save_cmds = { close_neotree() },
        pre_save_cmds = { ':windo if (bufname() =~ "neo-tree") | q | endif ' },
      }
      vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end,
  },

  {
    'folke/trouble.nvim',
    branch = 'dev', -- IMPORTANT!
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
  },

  -- abolish.vim
  -- https://github.com/tpope/vim-abolish
  { 'tpope/vim-abolish' },

  -- wilder
  -- https://github.com/gelguy/wilder.nvim
  {
    'gelguy/wilder.nvim',
    config = function()
      -- config goes here
    end,
  },
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup { theme = 'auto' }
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '2.11.0',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-\>]],
        autochdir = true,
        -- on_create = function(t)
        --   t.cmd = print(vim.loop.cwd())
        -- end,
      }
    end,
  },

  {
    'antoinemadec/vim-verilog-instance',
  },

  {
    'vhda/verilog_systemverilog.vim',
    config = function()
      vim.o.foldmethod = 'syntax'
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup {}
      -- local command = require 'neo-tree.command'
      vim.keymap.set('n', '<leader>te', ':Neotree reveal left toggle<CR>', { desc = '[T]oggle [E]xplorer' })
    end,
  },

  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup()
    end,
  },

  vim.filetype.add {
    extension = {
      v = 'verilog_systemverilog',
      svh = 'verilog_systemverilog',
      sv = 'verilog_systemverilog',
    },
  },
}

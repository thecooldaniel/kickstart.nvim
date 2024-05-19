return {
  -- AutoSession
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_restore_enabled = true,
        auto_session_enabled = true,
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
}

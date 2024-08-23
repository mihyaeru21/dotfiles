return {
  {
    'NeogitOrg/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require('neogit').setup {
        disable_commit_confirmation = true,
        mappings = {
          status = {
            ['o'] = 'Toggle',
          },
        },
        vim.keymap.set('n', '<space>gg', ':Neogit<CR>', { noremap = true })
      }
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
      require('gitsigns').setup()

      vim.keymap.set('n', '<space>gp', ':Gitsigns preview_hunk<CR>', { noremap = true })
      vim.keymap.set('n', '<space>gd', ':Gitsigns diffthis<CR>', { noremap = true })
      vim.keymap.set('n', '<space>gb', ':Gitsigns blame_line<CR>', { noremap = true })
      vim.keymap.set('n', '[g', ':Gitsigns prev_hunk<CR>', { noremap = true })
      vim.keymap.set('n', ']g', ':Gitsigns next_hunk<CR>', { noremap = true })
    end
  },
}

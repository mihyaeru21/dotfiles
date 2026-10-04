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
      require('neogit').setup({
        disable_context_highlighting = true, -- ハイライトされてると見辛い
        disable_commit_confirmation = true, -- 確認が邪魔
        mappings = {
          status = {
            ['o'] = 'Toggle',
            ['<tab>'] = 'OpenTree',
          },
        },
      })

      vim.keymap.set('n', '<Space>gg', ':Neogit<CR>', { silent = true })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    version = '^2',
    event = 'VeryLazy',
    config = function()
      require('gitsigns').setup()

      vim.keymap.set('n', '<Space>gp', ':Gitsigns preview_hunk<CR>', { silent = true })
      vim.keymap.set('n', '<Space>gd', ':Gitsigns diffthis<CR>', { silent = true })
      vim.keymap.set('n', '<Space>gb', ':Gitsigns blame_line<CR>', { silent = true })
      vim.keymap.set('n', '[g', ':Gitsigns prev_hunk<CR>', { silent = true })
      vim.keymap.set('n', ']g', ':Gitsigns next_hunk<CR>', { silent = true })
    end,
  },
}

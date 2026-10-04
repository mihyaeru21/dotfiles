return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    event = 'VeryLazy',
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      require('neo-tree').setup({
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_pattern = {
              '.git',
              '*.DS_Store',
              '*.pyc',
              '*.meta',
              '*.o',
              'thumbs.db',
            },
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
          },
        },
        window = {
          mappings = {
            ['o'] = 'open',
            ['i'] = 'open_split',
            ['s'] = 'open_vsplit',
          },
        },
      })

      vim.keymap.set('n', '<Space>n', ':Neotree float toggle reveal<CR>', { silent = true })
      vim.keymap.set('n', '<Space>j', ':Neotree float toggle buffers<CR>', { silent = true })
    end,
  },
  {
    'stevearc/aerial.nvim',
    event = 'VeryLazy',
    config = function()
      require('aerial').setup()
      vim.keymap.set('n', ']a', ':AerialNext<CR>', { silent = true })
      vim.keymap.set('n', '[a', ':AerialPrev<CR>', { silent = true })
      vim.keymap.set('n', '<Space>a', ':AerialToggle left<CR>', { silent = true })
      vim.keymap.set('n', '<Space>z', ':AerialNavToggle<CR>', { silent = true })
    end,
  },
}

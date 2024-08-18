return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    event = 'VeryLazy',
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      require('neo-tree').setup {
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
          }
        },
      }
    end
  },
  {
    'stevearc/aerial.nvim',
    event = 'VeryLazy',
    config = true,
  }
}

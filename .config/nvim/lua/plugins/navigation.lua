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
    opts = {
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
    },
    keys = {
      { '<Space>n', ':Neotree float toggle reveal<CR>', { silent = true } },
      { '<Space>j', ':Neotree float toggle buffers<CR>', { silent = true } },
    },
  },
  {
    'stevearc/aerial.nvim',
    event = 'VeryLazy',
    config = true,
    keys = {
      { ']a', ':AerialNext<CR>', { silent = true } },
      { '[a', ':AerialPrev<CR>', { silent = true } },
      { '<Space>a', ':AerialToggle left<CR>', { silent = true } },
      { '<Space>z', ':AerialNavToggle<CR>', { silent = true } },
    },
  },
}

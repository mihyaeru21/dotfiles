return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false, -- 元々 lazy になっている
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'mfussenegger/nvim-dap',
    },
    config = function()
      vim.g.rustaceanvim = {
        tools = {
        },
        server = {
          default_settings = {
            ['rust-analyzer'] = {
            },
          },
        },
        dap = {
          autoload_configurations = true,
        },
      }
    end
  },
  {
    'akinsho/flutter-tools.nvim',
    ft = { 'dart' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('flutter-tools').setup {
        flutter_lookup_cmd = 'mise where flutter',
      }

      require('telescope').load_extension('flutter')
    end
  },
  {
    'folke/lazydev.nvim',
    ft = { 'lua' },
    dependencies = {
      {
        'Bilal2453/luvit-meta',
        lazy = true,
      }
    },
    opts = {
      library = {
        {
          path = 'luvit-meta/library',
          words = {
            'vim%.uv',
          },
        },
      },
    },
  },
  {
    'AndrewRadev/vim-eco',
    ft = { 'eco' },
    dependencies = {
      'kchmck/vim-coffee-script',
    },
  },
}

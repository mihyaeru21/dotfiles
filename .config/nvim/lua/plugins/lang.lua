return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    event = 'VeryLazy', -- 元々 lazy になっているが lspconfig を遅らせているため合わせる
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'nvim-treesitter/nvim-treesitter',
      'mfussenegger/nvim-dap',
    },
    config = function()
      vim.g.rustaceanvim = {
        tools = {
        },
        server = {
          on_attach = require('config.lsp').make_on_attach(
            require('lspconfig'),
            require('cmp_nvim_lsp')
          ),
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
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require('flutter-tools').setup {
        flutter_lookup_cmd = 'asdf where flutter',
        lsp = {
          on_attach = require('config.lsp').make_on_attach(
            require('lspconfig'),
            require('cmp_nvim_lsp')
          ),
        },
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

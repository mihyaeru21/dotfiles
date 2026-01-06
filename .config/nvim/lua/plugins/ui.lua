return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      'EdenEast/nightfox.nvim', -- lualine の前に colorschema が読み込まれていてほしい
      'stevearc/aerial.nvim',
    },
    lazy = false,
    priority = 500,
    config = function()
      require('lualine').setup {
        options = {
          globalstatus = true,
          disabled_filetypes = {
            winbar = {
              'dap-repl', -- 競合するので無効化する
            },
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            {
              'tabs',
              mode = 2,
            },
          },
          lualine_x = {
            'searchcount',
            { 'encoding', show_bomb = true },
            'fileformat',
            'filetype',
          },
          lualine_y = {
            {
              'lsp_status',
              ignore_lsp = {
                'harper_ls',
                'GitHub Copilot',
              },
            },
          },
          lualine_z = { 'location' },
        },
        winbar = {
          lualine_a = {
            {
              'filetype',
              icon_only = true,
              padding = { left = 1, right = 0 },
              separator = { left = '', right = '' }
            },
            {
              'filename',
              path = 1,
              padding = { left = 0, right = 1 },
            },
          },
          lualine_b = { 'aerial' },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {
            {
              'filetype',
              icon_only = true,
              padding = { left = 1, right = 0 },
              separator = { left = '', right = '' }
            },
            {
              'filename',
              path = 1,
              padding = { left = 0, right = 1 },
            },
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {
          'aerial',
          'neo-tree',
          'quickfix',
        },
      }
    end
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    config = true,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    config = true,
  },
  {
    'kevinhwang91/nvim-hlslens',
    event = 'VeryLazy',
    config = function()
      require('hlslens').setup()

      local kmopts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kmopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kmopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kmopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kmopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kmopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kmopts)
      vim.api.nvim_set_keymap('n', '<space>l', ':noh<CR>', kmopts)
    end
  },
  {
    'petertriho/nvim-scrollbar',
    dependencies = {
      'kevinhwang91/nvim-hlslens',
      'lewis6991/gitsigns.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require('scrollbar').setup {
        show_in_active_only = true,
        hide_if_all_visible = true,
        excluded_filetypes = {
          'cmp_docs',
          'cmp_menu',
          'noice',
          'prompt',
          'TelescopePrompt',
          'dap-float',
          'dap-repl',
          'dapui_breakpoints',
          'dapui_console',
          'dapui_scopes',
          'dapui_stacks',
          'dapui_watches',
        },
      }
      require('scrollbar.handlers.search').setup()
    end,
  },
  {
    'numToStr/FTerm.nvim',
    event = 'VeryLazy',
    config = function()
      require('FTerm').setup {
        border     = 'single',
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      }
      vim.keymap.set('n', '<A-k>', '<CMD>lua require("FTerm").toggle()<CR>')
      vim.keymap.set('t', '<A-k>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    end
  },
}

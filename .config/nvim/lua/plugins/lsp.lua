return {
  {
    'neovim/nvim-lspconfig',
    version = '*',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    event = 'VeryLazy',
    config = function()
      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      -- mason 経由で入れるやつは mason-lspconfig 側に書く
      vim.lsp.enable({
        'biome',
        'ruby_lsp',
        'sorbet',
        'tsp_server',
      })

      vim.diagnostic.config({
        virtual_lines = { current_line = true },
        severity_sort = true, -- 深刻度の高いものを優先して表示する
      })

      vim.keymap.set('n', '<Space>e', function()
        -- diagnostic 表示をトグルする
        if vim.diagnostic.config().virtual_lines then
          vim.diagnostic.config({ virtual_lines = false })
        else
          vim.diagnostic.config({ virtual_lines = { current_line = true } })
        end
      end, { silent = true })
      vim.keymap.set('n', '<Space>q', function() vim.diagnostic.setloclist() end, { silent = true })
      vim.keymap.set('n', '<Space>f', function() vim.lsp.buf.format({ async = true }) end, { silent = true })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local buf = args.buf
          vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, { buf = buf, silent = true })
          vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { buf = buf, silent = true })
          vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, { buf = buf, silent = true })
          vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, { buf = buf, silent = true })
          vim.keymap.set(
            'n',
            '<Space>wa',
            function() vim.lsp.buf.add_workspace_folder() end,
            { buf = buf, silent = true }
          )
          vim.keymap.set(
            'n',
            '<Space>wr',
            function() vim.lsp.buf.remove_workspace_folder() end,
            { buf = buf, silent = true }
          )
          vim.keymap.set(
            'n',
            '<Space>wl',
            function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            { buf = buf, silent = true }
          )
          vim.keymap.set('n', '<Space>D', function() vim.lsp.buf.type_definition() end, { buf = buf, silent = true })
          vim.keymap.set('n', '<Space>rn', function() vim.lsp.buf.rename() end, { buf = buf, silent = true })
          vim.keymap.set('n', '<Space>ca', function() vim.lsp.buf.code_action() end, { buf = buf, silent = true })
          vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, { buf = buf, silent = true })
          vim.keymap.set(
            'n',
            '<Space>h',
            function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
            { buf = buf, silent = true }
          )
        end,
      })
    end,
  },
  {
    'mason-org/mason.nvim',
    version = '~2',
    event = 'VeryLazy',
    config = true,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    version = '~2',
    event = 'VeryLazy',
    config = function()
      require('mason-lspconfig').setup({
        -- 一部はパッケージマネージャ経由で入れたいのでここでは入れない
        ensure_installed = {
          'bashls',
          'cssls',
          'elixirls',
          'elp',
          'eslint',
          'gopls',
          -- 'harper_ls', -- しばしオフで生活する
          'jsonls',
          'lua_ls',
          'postgres_lsp',
          'rust_analyzer',
          'stylua',
          'tailwindcss',
          'taplo',
          'terraformls',
          'ts_ls',
          'tsp_server',
          'vimls',
          'yamlls',
        },
        automatic_enable = {
          exclude = {
            'rust_analyzer', -- rustaceanvim 側で起動されるので自動起動させない
          },
        },
      })
    end,
  },
  -- 1年くらい使わなかったら完全に削除する
  -- {
  --   'nvimtools/none-ls.nvim',
  --   -- prettier でしか使わないので JavaScript 系のみ
  --   ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  --   config = function()
  --     local null_ls = require("null-ls")
  --     null_ls.setup {
  --       sources = {
  --         null_ls.builtins.formatting.prettier.with {
  --           condition = function(utils)
  --             return utils.root_has_file {
  --               '.prettierrc',
  --               '.prettierrc.json', '.prettierrc.json5',
  --               '.prettierrc.yml', '.prettierrc.yaml', '.prettierrc.toml',
  --               '.prettierrc.js', 'prettier.config.js',
  --               '.prettierrc.tjs', 'prettier.config.tjs',
  --             }
  --           end,
  --         },
  --       },
  --     }
  --   end,
  -- },
}

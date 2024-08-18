return {
  {
    'neovim/nvim-lspconfig',
    version = '~0.1',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      {
        'mihyaeru21/nvim-lspconfig-bundler',
        main = 'lspconfig-bundler',
        config = true,
      },
    },
    event = 'VeryLazy',
    config = function()
      local lspconfig = require('lspconfig')
      local on_attach = require('config.lsp').make_on_attach(lspconfig, require('cmp_nvim_lsp'))

      for _, server in ipairs({
        'bashls',
        'elixirls',
        'elp',
        -- 'eslint',
        'flow',
        'gopls',
        'jsonls',
        -- 'lua_ls',
        -- 'ruby_lsp',
        'sorbet',
        'terraformls',
        -- 'tsserver',
        'vimls',
        'yamlls',
      }) do
        lspconfig[server].setup { on_attach = on_attach }
      end

      lspconfig.eslint.setup {
        on_attach = on_attach,
        -- 元の実装だと .eslintrc と tsconfig が別のディレクトリにあるパターンでうまく動かないので、その環境で動くようにする
        root_dir = lspconfig.util.root_pattern('package.json', '.git'),
      }

      lspconfig.ruby_lsp.setup {
        on_attach = function(client, bufnr)
          -- sorbet の hover を郵政したいのでこちらはオフにする
          -- TODO: hover に複数の provider がある場合にまとめて表示できるか調査
          client.server_capabilities.hoverProvider = false
          on_attach(client, bufnr)
        end,
        init_options = {
          formatter = 'syntax_tree',
        },
      }

      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            },
          },
        },
      }

      lspconfig.tsserver.setup {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)

          -- これは on_attach ではなく capabilities でやれば良さそうな気もする
          client.server_capabilities.documentFormattingProvider = false
        end,
        filetypes = {
          -- 元の実装だと javascript 系も含まれているが、そちらは flow で見るので含めない
          'typescript',
          'typescriptreact',
          'typescript.tsx',
        },
      }

      vim.diagnostic.config({
        virtual_text = false, -- virtual text が常に表示されると邪魔なのでオフにする
        severity_sort = true, -- 深刻度の高いものを優先して表示する
      })
    end
  },
  {
    'williamboman/mason.nvim',
    version = '~1',
    event = 'VeryLazy',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    version = '~1',
    event = 'VeryLazy',
    config = function()
      require('mason-lspconfig').setup {
        -- ruby, flow はパッケージマネージャ経由で入れたいのでここでは入れない
        ensure_installed = {
          'bashls',
          'elixirls',
          'elp',
          'eslint',
          'gopls',
          'jsonls',
          'lua_ls',
          'rust_analyzer',
          'terraformls',
          'tsserver',
          'vimls',
          'yamlls',
        },
      }
    end
  },
}

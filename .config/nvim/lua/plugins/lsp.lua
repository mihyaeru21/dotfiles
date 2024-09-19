return {
  {
    'neovim/nvim-lspconfig',
    version = '~1.0',
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

      lspconfig.bashls.setup {}
      lspconfig.elixirls.setup {}
      lspconfig.elp.setup {}
      lspconfig.flow.setup {}
      lspconfig.gopls.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.rubocop.setup {}
      lspconfig.sorbet.setup {}
      lspconfig.syntax_tree.setup {}
      lspconfig.terraformls.setup {}
      lspconfig.vimls.setup {}
      lspconfig.yamlls.setup {}

      lspconfig.eslint.setup {
        -- 元の実装だと .eslintrc と tsconfig が別のディレクトリにあるパターンでうまく動かないので、その環境で動くようにする
        root_dir = lspconfig.util.root_pattern('package.json', '.git'),
      }

      -- 必要になるまでコメントアウト
      -- lspconfig.ruby_lsp.setup {
      --   on_attach = function(client, _)
      --     -- sorbet の hover を郵政したいのでこちらはオフにする
      --     -- TODO: hover に複数の provider がある場合にまとめて表示できるか調査
      --     client.server_capabilities.hoverProvider = false
      --   end,
      --   init_options = {
      --     formatter = 'syntax_tree',
      --   },
      -- }

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            },
          },
        },
      }

      lspconfig.ts_ls.setup {
        on_attach = function(client, bufnr)
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

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
        capabilities = capabilities,
      })

      local kmopts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', kmopts)
      vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', kmopts)
      vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', kmopts)

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = args.buf
          vim.api.nvim_buf_set_keymap(buf, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', '<space>wl',
            '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', kmopts)
          vim.api.nvim_buf_set_keymap(buf, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', kmopts)
        end
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
          'ts_ls',
          'vimls',
          'yamlls',
        },
      }
    end
  },
}

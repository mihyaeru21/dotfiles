return {
  {
    'neovim/nvim-lspconfig',
    version = '~2',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'mihyaeru21/nvim-lspconfig-bundler',
    },
    event = 'VeryLazy',
    config = function()
      require('lspconfig-bundler').setup {}
      local lspconfig = require('lspconfig')

      lspconfig.bashls.setup {}
      lspconfig.elixirls.setup {}
      lspconfig.elp.setup {}
      lspconfig.eslint.setup {}
      lspconfig.gopls.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.terraformls.setup {}
      lspconfig.tsp_server.setup {}
      lspconfig.vimls.setup {}
      lspconfig.yamlls.setup {}

      lspconfig.biome.setup {
        -- プロジェクト内でインストールされているやつを使う
        cmd = { 'npx', 'biome', 'lsp-proxy' },
      }

      lspconfig.sorbet.setup {
        -- プロジェクトに sorbet/config がある場合（設定されている場合）のみ起動する
        root_dir = function(fname)
          local root_dir = lspconfig.util.root_pattern('Gemfile', '.git')(fname)
          if root_dir == nil then
            return nil
          end
          local sorbet_config = root_dir .. '/sorbet/config'
          local config_exists = vim.fn.filereadable(sorbet_config) == 1
          if config_exists then
            return root_dir
          end
          return nil
        end,
      }

      lspconfig.ruby_lsp.setup {}

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
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }

      vim.diagnostic.config({
        virtual_lines = { current_line = true },
        severity_sort = true, -- 深刻度の高いものを優先して表示する
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
        capabilities = capabilities,
      })

      local kmopts = { noremap = true, silent = true }
      vim.keymap.set('n', '<space>e', function()
        if vim.diagnostic.config().virtual_lines then
          vim.diagnostic.config({ virtual_lines = false })
        else
          vim.diagnostic.config({ virtual_lines = { current_line = true } })
        end
      end, kmopts)
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
        -- 一部はパッケージマネージャ経由で入れたいのでここでは入れない
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
        automatic_installation = false,
      }
    end
  },
  {
    'nvimtools/none-ls.nvim',
    -- prettier でしか使わないので javascript 系のみ
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettier.with {
            condition = function(utils)
              return utils.root_has_file {
                '.prettierrc',
                '.prettierrc.json', '.prettierrc.json5',
                '.prettierrc.yml', '.prettierrc.yaml', '.prettierrc.toml',
                '.prettierrc.js', 'prettier.config.js',
                '.prettierrc.tjs', 'prettier.config.tjs',
              }
            end,
          },
        },
      }
    end,
  },
}

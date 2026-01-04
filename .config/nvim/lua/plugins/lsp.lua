return {
  {
    'neovim/nvim-lspconfig',
    version = '~2',
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

      local kmopts = { noremap = true, silent = true }
      vim.keymap.set('n', '<space>e', function()
        -- diagnostic 表示をトグルする
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
      require('mason-lspconfig').setup {
        -- 一部はパッケージマネージャ経由で入れたいのでここでは入れない
        ensure_installed = {
          'bashls',
          'elixirls',
          'elp',
          'eslint',
          'gopls',
          'harper_ls',
          'jsonls',
          'lua_ls',
          'rust_analyzer',
          'terraformls',
          'ts_ls',
          'tsp_server',
          'vimls',
          'yamlls',
        },
        automatic_enable = {
          exclude = {
            "rust_analyzer", -- rustaceanvim 側で起動されるので自動起動させない
          },
        },
      }
    end
  },
  {
    'nvimtools/none-ls.nvim',
    -- prettier でしか使わないので JavaScript 系のみ
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

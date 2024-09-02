return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'ray-x/cmp-treesitter',
      'hrsh7th/vim-vsnip',
      'onsails/lspkind.nvim', -- アイコン表示
    },
    config = function()
      local cmp = require 'cmp'
      local lspkind = require('lspkind')

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
        }, {
          { name = 'vsnip' },
          { name = 'treesitter' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            before = function(_, vim_item)
              return vim_item
            end
          })
        },
      })

      -- 検索時に buffer から補完する
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      -- コマンドを補完する
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        })
      })
    end
  },
  {
    'github/copilot.vim',
    event = 'VeryLazy',
    config = function()
      vim.g.copilot_filetypes = {
        markdown = false,
      }
    end,
  },
}

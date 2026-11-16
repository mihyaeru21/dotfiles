return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false, -- lazy はサポートされてない
    config = function()
      require('nvim-treesitter').setup()

      -- fold
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldtext = ''
      vim.opt.foldcolumn = '1'
      vim.opt.fillchars = {
        eob = ' ',
        foldclose = '',
        foldopen = '',
        foldsep = ' ',
        foldinner = ' ',
      }

      -- syntax highlight
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter_start', { clear = true }),
        callback = function(args)
          -- パーサーがある場合だけ start する
          local lang = vim.treesitter.language.get_lang(args.match)
          if lang and vim.treesitter.language.add(lang) then vim.treesitter.start(args.buf, lang) end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy',
    config = function()
      require('treesitter-context').setup({
        enable = true,
        multiline_threshold = 1,
      })
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = true,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
}

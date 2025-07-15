return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false, -- lazy はサポートされてない
    config = function()
      require 'nvim-treesitter'.setup()

      -- fold
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldenable = false
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy',
    config = function()
      require('treesitter-context').setup {
        enable = true,
        multiline_threshold = 1,
      }
    end
  },
}

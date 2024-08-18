return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'VeryLazy',
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = 'all',
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
      -- まだ experimental なのでオフにしておく(Ruby で変になる気がする)
      -- indent = {
      --   enable = true,
      -- },
    }

    -- fold
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.foldenable = false
  end
}

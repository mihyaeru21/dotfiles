return {
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = true,
  },
  {
    'tpope/vim-abolish',
    event = 'VeryLazy',
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    keys = {
      { '[s', function() require('flash').jump() end, silent = true, desc = 'Flash' },
      { ']s', function() require('flash').treesitter() end, silent = true, desc = 'Flash Treesitter' },
    },
  },
}

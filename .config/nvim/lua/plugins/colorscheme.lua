return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false, -- メインのやつなので遅延読み込みしない
    priority = 1000,
    config = function()
      require('nightfox').setup {
        options = {
          -- transparent = true,
        },
        groups = {
          all = {
            VertSplit = { bg = 'bg0' }, -- デフォルトは細くて見づらい
          },
        },
      }
      vim.cmd('colorscheme nightfox') -- lualine の前に呼び出しておく
    end,
  },
  {
    'nanotech/jellybeans.vim',
    lazy = true,
  },
}

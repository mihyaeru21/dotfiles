return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false, -- メインのやつなので遅延読み込みしない
    priority = 1000, -- lualine より大きい値に設定して先に読み込む
    opts = {
      options = {
        -- transparent = true,
      },
      groups = {
        all = {
          -- これらはデフォルトは細くて見づらい
          VertSplit = { bg = 'bg0' },
          WinSeparator = { bg = 'bg0' },

          -- 境界をわかりやすくする
          TreesitterContextBottom = { style = 'underline', sp = 'fg3' },
        },
      },
    },
    config = function()
      -- lualine より先に呼び出したい
      vim.cmd.colorscheme('nordfox')
    end,
  },
  {
    'nanotech/jellybeans.vim',
    lazy = true,
    config = function()
      -- let g:jellybeans_overrides = {
      -- \   'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
      -- \}
      -- if has('termguicolors') && &termguicolors
      --     let g:jellybeans_overrides['background']['guibg'] = 'none'
      -- endif
    end,
  },
}

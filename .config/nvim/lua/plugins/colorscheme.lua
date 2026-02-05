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
            -- これらはデフォルトは細くて見づらい
            VertSplit = { bg = 'bg0' },
            WinSeparator = { bg = 'bg0' },

            -- 境界をわかりやすくする
            TreesitterContextBottom = { style = 'underline', sp = 'fg3' },
          },
        },
      }
      vim.cmd('colorscheme nordfox') -- lualine の前に呼び出しておく
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

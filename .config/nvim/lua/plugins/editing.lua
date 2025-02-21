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
    'mbbill/undotree',
    event = 'VeryLazy',
    config = function()
    vim.keymap.set('n', '<space>U', ':UndotreeToggle<CR>', { noremap = true })
    end,
  },
}

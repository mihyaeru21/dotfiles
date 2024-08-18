return {
  'kndndrj/nvim-dbee',
  version = '~0.1',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy',
  build = function()
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup()
    vim.api.nvim_set_keymap('n', '<space>b', '<cmd>lua require("dbee").toggle()<CR>', { noremap = true, silent = true })
  end
}

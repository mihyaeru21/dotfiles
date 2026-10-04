return {
  'kndndrj/nvim-dbee',
  version = '~0.1',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy',
  build = function() require('dbee').install() end,
  config = function()
    require('dbee').setup()
    vim.keymap.set('n', '<Space>b', function() require('dbee').toggle() end, { silent = true })
  end,
}

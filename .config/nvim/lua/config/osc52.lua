vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- 選択した範囲をコピー
vim.keymap.set('x', '<space>c', '"+y')
-- 現在の行をコピー
vim.keymap.set('n', '<space>cc', 'V"+y')
-- 現在のファイルの相対パスをコピー
vim.keymap.set('n', '<space>cf', function()
  local path = vim.fn.expand('%:.')
  if path == '' then
    return
  end
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end)

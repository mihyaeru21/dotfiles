-- ウィンドウ操作
vim.keymap.set('n', '<Space>s', ':split<CR>', { silent = true })
vim.keymap.set('n', '<Space>v', ':vsplit<CR>', { silent = true })
vim.keymap.set('n', '<C-w><C-h>', '5<C-w><', { silent = true }) -- ウィンドウ横を小さく
vim.keymap.set('n', '<C-w><C-j>', '5<C-w>-', { silent = true }) -- ウィンドウ縦を小さく
vim.keymap.set('n', '<C-w><C-k>', '5<C-w>+', { silent = true }) -- ウィンドウ縦を大きく
vim.keymap.set('n', '<C-w><C-l>', '5<C-w>>', { silent = true }) -- ウィンドウ横を大きく

-- タブ操作
vim.keymap.set('n', '<Space>tt', ':tabnew<CR>', { silent = true })
vim.keymap.set('n', '<Space>tn', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', '<Space>tp', ':tabprevious<CR>', { silent = true })

-- <C-]>だけだとジャンプ先タグが複数あった場合に見逃す
vim.keymap.set('n', '<C-]>', 'g<C-]>', { silent = true })

-- コマンドモードで途中入力履歴呼び出し
vim.keymap.set('c', '<C-p>', '<Up>', { silent = true })
vim.keymap.set('c', '<C-n>', '<Down>', { silent = true })

-- 現在開いているバッファのパスを展開する
vim.keymap.set('c', '%%', "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { expr = true, silent = true })

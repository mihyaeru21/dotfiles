-- ウィンドウ操作
vim.keymap.set('n', '<space>s', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w><C-h>', '5<C-w><', { noremap = true }) -- ウィンドウ横を小さく
vim.keymap.set('n', '<C-w><C-j>', '5<C-w>-', { noremap = true }) -- ウィンドウ縦を小さく
vim.keymap.set('n', '<C-w><C-k>', '5<C-w>+', { noremap = true }) -- ウィンドウ縦を大きく
vim.keymap.set('n', '<C-w><C-l>', '5<C-w>>', { noremap = true }) -- ウィンドウ横を大きく

-- タブ操作
vim.keymap.set('n', '<space>tt', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>tn', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>tp', ':tabprevious<CR>', { noremap = true, silent = true })

-- <C-]>だけだとジャンプ先タグが複数あった場合に見逃す
vim.keymap.set('n', '<C-]>', 'g<C-]>', { noremap = true })

-- コマンドモードで途中入力履歴呼び出し
vim.keymap.set('c', '<C-p>', '<Up>', { noremap = true })
vim.keymap.set('c', '<C-n>', '<Down>', { noremap = true })

-- 現在開いているバッファのパスを展開する
vim.keymap.set('c', '%%', "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { expr = true, noremap = true })

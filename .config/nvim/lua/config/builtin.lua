-- builtin plugin の設定

vim.cmd.packadd('nvim.difftool')
vim.cmd.packadd('nvim.undotree')

vim.keymap.set('n', '<space>U', ':Undotree<CR>', { noremap = true })

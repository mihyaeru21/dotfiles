vim.o.guifont = "Bizin Gothic Discord NF:h14"
vim.opt.linespace = 0

vim.keymap.set('n', '<A-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('v', '<A-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('c', '<A-v>', '<C-R>+', { noremap = true, silent = true })
vim.keymap.set('i', '<A-v>', '<C-o>"+p', { noremap = true, silent = true })

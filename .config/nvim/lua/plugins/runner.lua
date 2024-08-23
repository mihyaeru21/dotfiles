return {
  {
    'thinca/vim-quickrun',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<space>r', ':<C-u>QuickRun -mode n<CR>', { noremap = true })
      vim.keymap.set('v', '<space>r', ':<C-u>QuickRun -mode n<CR>', { noremap = true })
    end
  },
}

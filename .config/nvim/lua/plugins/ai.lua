return {
  {
    'github/copilot.vim',
    event = 'VeryLazy',
    config = function()
      local filetypes = {
        markdown = false,
      }
      filetypes["copilot-chat"] = false
      vim.g.copilot_filetypes = filetypes
    end,
  },
}

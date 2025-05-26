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
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    event = 'VeryLazy',
    opts = {
      show_help = false,
      mappings = {
        show_diff = {
          normal = 'gkd',
          full_diff = true,
        },
      },
    },
  },
}

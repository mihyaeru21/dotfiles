return {
  {
    'NeogitOrg/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require('neogit').setup {
        disable_commit_confirmation = true,
        mappings = {
          status = {
            ['o'] = 'Toggle',
          },
        },
      }
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = true,
  },
}

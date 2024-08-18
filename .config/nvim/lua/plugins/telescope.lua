return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'LukasPietzschmann/telescope-tabs',
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      version = '^1.0',
    },
  },
  event = 'VeryLazy',
  config = function()
    local ts = require('telescope')

    ts.setup {
      defaults = {
        layout_strategy = 'flex',
        layout_config = {
          prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
      },
    }

    ts.load_extension('live_grep_args')
    ts.load_extension('telescope-tabs')

    require('telescope-tabs').setup()
  end
}

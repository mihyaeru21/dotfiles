return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'LukasPietzschmann/telescope-tabs',
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
  event = 'VeryLazy',
  config = function()
    local ts = require('telescope')

    ts.setup({
      defaults = {
        layout_strategy = 'flex',
        layout_config = {
          prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
        cache_picker = {
          num_pickers = 100,
          limit_entries = 1000,
        },
      },
    })

    ts.load_extension('live_grep_args')
    ts.load_extension('telescope-tabs')

    require('telescope-tabs').setup()
  end,
  keys = {
    { '<Space>uu', ':Telescope builtin<CR>', { silent = true } },
    { '<Space>uf', ':Telescope find_files<CR>', { silent = true } },
    { '<Space>um', ':Telescope oldfiles<CR>', { silent = true } },
    { '<Space>ug', ':Telescope live_grep_args<CR>', { silent = true } },
    { '<Space>uwg', ':Telescope grep_string<CR>', { silent = true } },
    { '<Space>utt', ':Telescope telescope-tabs list_tabs<CR>', { silent = true } },
    { '<Space>uts', ':Telescope treesitter<CR>', { silent = true } },
    { '<Space>ud', ':Telescope diagnostics<CR>', { silent = true } },
    { '<Space>ub', ':Telescope buffers<CR>', { silent = true } },
    { '<Space>us', ':Telescope tagstack<CR>', { silent = true } },
    { '<Space>ur', ':Telescope resume<CR>', { silent = true } },
    { '<Space>up', ':Telescope pickers<CR>', { silent = true } },
    { '<Space>uld', ':Telescope lsp_definitions<CR>', { silent = true } },
    { '<Space>ulr', ':Telescope lsp_references<CR>', { silent = true } },
    { '<Space>uli', ':Telescope lsp_implementations<CR>', { silent = true } },
    { '<Space>ulsd', ':Telescope lsp_document_symbols<CR>', { silent = true } },
    { '<Space>ulsw', ':Telescope lsp_workspace_symbols<CR>', { silent = true } },
    { '<Space>uaf', ':Telescope flutter commands<CR>', { silent = true } },
  },
}

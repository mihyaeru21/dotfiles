return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'LukasPietzschmann/telescope-tabs',
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
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

    vim.keymap.set('n', '<space>uu', ':Telescope builtin<CR>', { silent = true })
    vim.keymap.set('n', '<space>uf', ':Telescope find_files<CR>', { silent = true })
    vim.keymap.set('n', '<space>um', ':Telescope oldfiles<CR>', { silent = true })
    vim.keymap.set('n', '<space>ug', ':Telescope live_grep_args<CR>', { silent = true })
    vim.keymap.set('n', '<space>uwg', ':Telescope grep_string<CR>', { silent = true })
    vim.keymap.set('n', '<space>utt', ':Telescope telescope-tabs list_tabs<CR>', { silent = true })
    vim.keymap.set('n', '<space>uts', ':Telescope treesitter<CR>', { silent = true })
    vim.keymap.set('n', '<space>ud', ':Telescope diagnostics<CR>', { silent = true })
    vim.keymap.set('n', '<space>ub', ':Telescope buffers<CR>', { silent = true })
    vim.keymap.set('n', '<space>us', ':Telescope tagstack<CR>', { silent = true })
    vim.keymap.set('n', '<space>ur', ':Telescope resume<CR>', { silent = true })
    vim.keymap.set('n', '<space>up', ':Telescope pickers<CR>', { silent = true })
    vim.keymap.set('n', '<space>uld', ':Telescope lsp_definitions<CR>', { silent = true })
    vim.keymap.set('n', '<space>ulr', ':Telescope lsp_references<CR>', { silent = true })
    vim.keymap.set('n', '<space>uli', ':Telescope lsp_implementations<CR>', { silent = true })
    vim.keymap.set('n', '<space>ulsd', ':Telescope lsp_document_symbols<CR>', { silent = true })
    vim.keymap.set('n', '<space>ulsw', ':Telescope lsp_workspace_symbols<CR>', { silent = true })
    vim.keymap.set('n', '<space>uaf', ':Telescope flutter commands<CR>', { silent = true })
  end,
}

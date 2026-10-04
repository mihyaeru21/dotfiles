return {
  {
    'thinca/vim-quickrun',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<Space>R', ':<C-u>QuickRun -mode n<CR>', { silent = true })
      vim.keymap.set('v', '<Space>R', ':<C-u>QuickRun -mode n<CR>', { silent = true })
    end,
  },
  {
    'nvim-neotest/neotest',
    version = '*',
    event = 'VeryLazy',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'mrcjkb/rustaceanvim',
      {
        'fredrikaverpil/neotest-golang',
        version = '*',
        build = function() vim.system({ 'go', 'install', 'gotest.tools/gotestsum@latest' }):wait() end,
      },
      'marilari88/neotest-vitest',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('rustaceanvim.neotest'),
          require('neotest-golang')({
            runner = 'gotestsum',
          }),
          require('neotest-vitest'),
        },
      })

      vim.keymap.set('n', '<Space>rr', ':Neotest run<CR>', { silent = true })
      vim.keymap.set('n', '<Space>rs', ':Neotest summary<CR>', { silent = true })
      vim.keymap.set('n', '<Space>rp', ':Neotest output-panel<CR>', { silent = true })
    end,
  },
}

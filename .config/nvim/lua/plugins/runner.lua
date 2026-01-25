return {
  {
    'thinca/vim-quickrun',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<space>R', ':<C-u>QuickRun -mode n<CR>', { noremap = true })
      vim.keymap.set('v', '<space>R', ':<C-u>QuickRun -mode n<CR>', { noremap = true })
    end
  },
  {
    'nvim-neotest/neotest',
    event = 'VeryLazy',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'mrcjkb/rustaceanvim',
      {
        'fredrikaverpil/neotest-golang',
        version = '*',
        build = function()
          vim.system({ 'go', 'install', 'gotest.tools/gotestsum@latest' }):wait()
        end,
      },
      'marilari88/neotest-vitest',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require('rustaceanvim.neotest'),
          require('neotest-golang') {
            runner = 'gotestsum',
          },
          require("neotest-vitest"),
        },
      }

      vim.keymap.set('n', '<space>rr', ':Neotest run<CR>', { noremap = true })
      vim.keymap.set('n', '<space>rs', ':Neotest summary<CR>', { noremap = true })
      vim.keymap.set('n', '<space>rp', ':Neotest output-panel<CR>', { noremap = true })
    end,
  },
}

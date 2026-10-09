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
    cmd = 'Neotest', -- require('rustaceanvim.neotest') に 1500 ms ほどかかるので使うタイミングでロードする
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
    end,
    keys = {
      { '<Space>rr', ':Neotest run<CR>', { silent = true } },
      { '<Space>rs', ':Neotest summary<CR>', { silent = true } },
      { '<Space>rp', ':Neotest output-panel<CR>', { silent = true } },
    },
  },
}

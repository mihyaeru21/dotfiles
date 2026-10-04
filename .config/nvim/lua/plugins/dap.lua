return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    event = 'VeryLazy',
    config = function()
      require('dapui').setup()
      local dap = require('dap')
      local dapui = require('dapui')
      local widgets = require('dap.ui.widgets')

      dap.adapters.ruby = function(callback, config)
        local executable
        if config.bundler then
          executable = {
            command = 'bundle',
            args = vim.list_extend(
              { 'exec', 'rdbg', '-n', '--open', '--port', '${port}', '-c', '--', 'bundle', 'exec', config.command },
              config.args
            ),
          }
        else
          executable = {
            command = 'rdbg',
            args = vim.list_extend({ '-n', '--open', '--port', '${port}', '-c', '--', config.command }, config.args),
          }
        end

        callback({
          type = 'server',
          host = '127.0.0.1',
          port = '${port}',
          executable = executable,
        })
      end
      dap.configurations.ruby = {
        {
          type = 'ruby',
          name = 'debug current file',
          request = 'attach',
          localfs = true,
          bundler = false,
          command = 'ruby',
          args = '${file}',
          options = {
            source_filetype = 'ruby',
          },
        },
        {
          type = 'ruby',
          name = 'be rails: debug server',
          request = 'attach',
          localfs = true,
          bundler = true,
          command = 'rails',
          args = 'server',
          options = {
            source_filetype = 'ruby',
          },
        },
        {
          type = 'ruby',
          name = 'be rspec: debug current file',
          request = 'attach',
          localfs = true,
          bundler = true,
          command = 'rspec',
          args = '${file}',
          options = {
            source_filetype = 'ruby',
          },
        },
      }

      vim.keymap.set('n', '<Space>dd', function() dapui.toggle() end, { silent = true })
      vim.keymap.set('n', '<Space>dc', function() dap.continue() end, { silent = true })
      vim.keymap.set('n', '<Space>dl', function() dap.step_over() end, { silent = true })
      vim.keymap.set('n', '<Space>dj', function() dap.step_into() end, { silent = true })
      vim.keymap.set('n', '<Space>dk', function() dap.step_out() end, { silent = true })
      vim.keymap.set('n', '<Space>db', function() dap.toggle_breakpoint() end, { silent = true })
      vim.keymap.set('n', '<Space>dq', function() dap.terminate() end, { silent = true })
      vim.keymap.set('n', '<Space>dr', function() dap.repl.open() end, { silent = true })
      vim.keymap.set('n', '<Space>dh', function() widgets.hover() end, { silent = true })
      vim.keymap.set('n', '<Space>dp', function() widgets.preview() end, { silent = true })
      vim.keymap.set(
        'n',
        '<Space>dm',
        function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
        { silent = true }
      )
      vim.keymap.set('n', '<Space>df', function() widgets.centered_float(widgets.frames) end, { silent = true })
      vim.keymap.set('n', '<Space>ds', function() widgets.centered_float(widgets.scopes) end, { silent = true })
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'VeryLazy',
    config = true,
  },
  {
    'leoluz/nvim-dap-go',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'VeryLazy',
    config = function()
      require('dap-go').setup({
        dap_configurations = {
          {
            type = 'go',
            name = 'Attach remote',
            mode = 'remote',
            request = 'attach',
          },
        },
      })
    end,
  },
}

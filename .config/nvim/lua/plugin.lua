require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'othree/eregex.vim'
  use 'thinca/vim-quickrun'
  use 'nanotech/jellybeans.vim'
  use 'EdenEast/nightfox.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use 'junegunn/vim-easy-align'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'nvim-telescope/telescope-live-grep-args.nvim'
  use 'stevearc/dressing.nvim'
  use 'lewis6991/gitsigns.nvim'
  use { 'NeogitOrg/neogit', requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } }
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  }
  use 'kevinhwang91/nvim-hlslens'
  use { 'petertriho/nvim-scrollbar', requires = 'kevinhwang91/nvim-hlslens' }
  use 'ojroques/nvim-osc52'
  use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use 'folke/neodev.nvim'

  -- 補完
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'ray-x/cmp-treesitter'
  use 'onsails/lspkind.nvim' -- アイコン表示

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'mrcjkb/rustaceanvim'
  use { 'mihyaeru21/nvim-lspconfig-bundler', requires = 'neovim/nvim-lspconfig' }
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- dap
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } }

  use 'github/copilot.vim'

  use {
    'AndrewRadev/vim-eco',
    ft = { 'eco' },
    requires = { { 'kchmck/vim-coffee-script' } },
  }

  use {
    'kndndrj/nvim-dbee',
    requires = { 'MunifTanjim/nui.nvim', },
    run = function()
      require('dbee').install()
    end,
    config = function()
      require('dbee').setup()
      vim.api.nvim_set_keymap('n', '<space>b', '<cmd>lua require("dbee").toggle()<CR>', { noremap = true, silent = true })
    end
  }

  use {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup()
    end,
  }
end)

-- TODO: どれかがインストールされていない場合ここ以降は実行しないようにしたい

------------------------------------------
-- nvim-cmp
------------------------------------------

local cmp = require 'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
  }, {
    { name = 'vsnip' },
    { name = 'treesitter' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      before = function(_, vim_item)
        return vim_item
      end
    })
  },
})

-- 検索時に buffer から補完する
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- コマンドを補完する
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  })
})


------------------------------------------
-- nvim-treesitter
------------------------------------------

require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'c',
    'clojure',
    'commonlisp',
    'cpp',
    'css',
    'dart',
    'diff',
    'dockerfile',
    'elixir',
    'erlang',
    'gdscript',
    'go',
    'gomod',
    'gosum',
    'haskell',
    'hcl',
    'html',
    'java',
    'javascript',
    'json',
    'json5',
    'kotlin',
    'lua',
    'make',
    'perl',
    'proto',
    'python',
    'ruby',
    'rust',
    'scala',
    'scss',
    'sql',
    'terraform',
    'tmux',
    'toml',
    'tsv',
    'tsx',
    'tsx',
    'typescript',
    'vim',
    'xml',
    'yaml',
    'zig',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  -- まだ experimental なのでオフにしておく(Ruby で変になる気がする)
  -- indent = {
  --   enable = true,
  -- },
}

-- fold
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false


------------------------------------------
-- lsp
------------------------------------------

local lspconfig = require('lspconfig')

-- lspconfig の setup より先に実行しないと反映されない
require('lspconfig-bundler').setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  capabilities = capabilities,
})

require('mason').setup()
require('mason-lspconfig').setup {
  -- ruby, flow はパッケージマネージャ経由で入れたいのでここでは入れない
  ensure_installed = {
    'bashls',
    'elixirls',
    'elp',
    'eslint',
    'gopls',
    'jsonls',
    'lua_ls',
    'rust_analyzer',
    'terraformls',
    'tsserver',
    'vimls',
    'yamlls',
  },
}

local kmopts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', kmopts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', kmopts)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', kmopts)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', kmopts)
end

for _, server in ipairs({
  'bashls',
  'elixirls',
  'elp',
  -- 'eslint',
  'flow',
  'gopls',
  'jsonls',
  -- 'lua_ls',
  -- 'ruby_lsp',
  'sorbet',
  'terraformls',
  -- 'tsserver',
  'vimls',
  'yamlls',
}) do
  lspconfig[server].setup { on_attach = on_attach }
end

lspconfig.eslint.setup {
  on_attach = on_attach,
  -- 元の実装だと .eslintrc と tsconfig が別のディレクトリにあるパターンでうまく動かないので、その環境で動くようにする
  root_dir = lspconfig.util.root_pattern('package.json', '.git'),
}

lspconfig.ruby_lsp.setup {
  on_attach = function(client, bufnr)
    -- sorbet の hover を郵政したいのでこちらはオフにする
    -- TODO: hover に複数の provider がある場合にまとめて表示できるか調査
    client.server_capabilities.hoverProvider = false
    on_attach(client, bufnr)
  end,
  init_options = {
    formatter = 'syntax_tree',
  },
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
}

lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    -- これは on_attach ではなく capabilities でやれば良さそうな気もする
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = {
    -- 元の実装だと javascript 系も含まれているが、そちらは flow で見るので含めない
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
}

-- もろもろを LSP と統合するやつ
local null_ls = require('null-ls');
null_ls.setup({
  -- debounce = 250, -- デフォルト 250 が重いときはここをいじる
  sources = {
    -- null_ls.builtins.diagnostics.cspell, -- 重いからいったんやめる
    -- eslint は null-ls で動かすと重いので lsp server のやつを使う
    null_ls.builtins.formatting.prettier.with {
      prefer_local = 'node_modules/.bin',
    },
  },
})

require('flutter-tools').setup {
  flutter_lookup_cmd = 'asdf where flutter',
  lsp = {
    on_attach = on_attach,
  },
}


vim.diagnostic.config({
  virtual_text = false, -- virtual text が常に表示されると邪魔なのでオフにする
  severity_sort = true, -- 深刻度の高いものを優先して表示する
})

vim.g.rustaceanvim = {
  tools = {
  },
  server = {
    on_attach = on_attach,
    default_settings = {
      ['rust-analyzer'] = {
      },
    },
  },
  dap = {
    autoload_configurations = true,
  },
}

------------------------------------------
-- nvim-dap
------------------------------------------

require('nvim-dap-virtual-text').setup()
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
        config.args),
    }
  else
    executable = {
      command = 'rdbg',
      args = vim.list_extend({ '-n', '--open', '--port', '${port}', '-c', '--', config.command }, config.args),
    }
  end

  callback {
    type = 'server',
    host = '127.0.0.1',
    port = '${port}',
    executable = executable,
  }
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

vim.keymap.set('n', '<Space>dd', function() dapui.toggle() end)
vim.keymap.set('n', '<Space>dc', function() dap.continue() end)
vim.keymap.set('n', '<Space>dl', function() dap.step_over() end)
vim.keymap.set('n', '<Space>dj', function() dap.step_into() end)
vim.keymap.set('n', '<Space>dk', function() dap.step_out() end)
vim.keymap.set('n', '<Space>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Space>dq', function() dap.terminate() end)
vim.keymap.set('n', '<Space>dk', function() dap.step_out() end)
vim.keymap.set('n', '<Space>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Space>dh', function() widgets.hover() end)
vim.keymap.set('n', '<Space>dp', function() widgets.preview() end)
vim.keymap.set('n', '<Space>dm', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Space>df', function() widgets.centered_float(widgets.frames) end)
vim.keymap.set('n', '<Space>ds', function() widgets.centered_float(widgets.scopes) end)


------------------------------------------
-- misc
------------------------------------------

-- git
require('neogit').setup {
  disable_commit_confirmation = true,
  mappings = {
    status = {
      ['o'] = 'Toggle',
    },
  },
}
require('gitsigns').setup {}

require('ibl').setup {}

-- neo-tree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require('neo-tree').setup {
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_pattern = {
        '.git',
        '*.DS_Store',
        '*.pyc',
        '*.meta',
        '*.o',
        'thumbs.db',
      },
    },
  },
  buffers = {
    follow_current_file = {
      enabled = true,
    },
  },
  window = {
    mappings = {
      ['o'] = 'open',
      ['i'] = 'open_split',
      ['s'] = 'open_vsplit',
    }
  },
}

-- nvim-hlslens
vim.api.nvim_set_keymap('n', 'n',
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', 'N',
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', '<space>l', ':noh<CR>', kmopts)

-- nvim-scrollbar
require('scrollbar').setup {
  show_in_active_only = true,
  hide_if_all_visible = true,
  excluded_filetypes = {
    'cmp_docs',
    'cmp_menu',
    'noice',
    'prompt',
    'TelescopePrompt',
    'dap-float',
    'dap-repl',
    'dapui_breakpoints',
    'dapui_console',
    'dapui_scopes',
    'dapui_stacks',
    'dapui_watches',
  },
}
require('scrollbar.handlers.search').setup {}

-- nvim-osc52
local osc52 = require('osc52')
vim.keymap.set('n', '<space>c', osc52.copy_operator, { expr = true })
vim.keymap.set('n', '<space>cc', '<space>c_', { remap = true })
vim.keymap.set('x', '<space>c', osc52.copy_visual)
vim.keymap.set('n', '<space>cf', function()
  -- 現在のファイルの相対パスをコピー
  osc52.copy(vim.fn.expand('%:.'))
end)

-- nightfox
require('nightfox').setup {
  options = {
    -- transparent = true,
  },
  groups = {
    all = {
      VertSplit = { bg = 'bg0' }, -- デフォルトは細くて見づらい
    },
  },
}
vim.cmd('colorscheme nightfox') -- lualine の前に呼び出しておく

-- lualine
require('lualine').setup {
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        path = 1,
      },
    },
    lualine_x = { 'searchcount', 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  extensions = {
    'neo-tree',
    'quickfix',
  },
}

-- telescope
require('telescope').setup {
  defaults = {
    layout_strategy = 'flex',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
  },
}
require('telescope').load_extension('flutter')
require('telescope').load_extension('live_grep_args')

-- dressing
require('dressing').setup {}

-- neodev
require('neodev').setup({
  library = {
    plugins = {
      'nvim-dap-ui',
      -- 'neotest',
    },
    types = true
  },
})

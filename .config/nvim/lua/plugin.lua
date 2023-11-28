require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'othree/eregex.vim'
  use 'thinca/vim-quickrun'
  use 'nanotech/jellybeans.vim'
  use 'EdenEast/nightfox.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'tpope/vim-abolish'
  use 'junegunn/vim-easy-align'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'nvim-telescope/telescope-live-grep-args.nvim'
  use 'stevearc/dressing.nvim'
  use 'lewis6991/gitsigns.nvim'
  use { 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
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
  use 'simrat39/rust-tools.nvim'
  use { 'mihyaeru21/nvim-lspconfig-bundler', requires = 'neovim/nvim-lspconfig' }
  use { 'mihyaeru21/nvim-ruby-lsp', requires = 'neovim/nvim-lspconfig' }
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

  use 'github/copilot.vim'

  use {
    'AndrewRadev/vim-eco',
    ft = { 'eco' },
    requires = { { 'kchmck/vim-coffee-script' } },
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
    'dart',
    'dockerfile',
    'go',
    'hcl',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'make',
    'perl',
    'proto',
    'python',
    'ruby',
    'rust',
    'scss',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
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
  indent = {
    enable = true,
  },
}

-- fold
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = vim.fn['nvim_treesitter#foldexpr']()


------------------------------------------
-- lsp
------------------------------------------

local lspconfig = require('lspconfig')

-- lspconfig の setup より先に実行しないと反映されない
require('rust-tools').setup {}
require('lspconfig-bundler').setup {}
require('ruby-lsp').setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  capabilities = capabilities,
})

require('mason').setup()
require('mason-lspconfig').setup {
  -- ruby, flow はパッケージマネージャ経由で入れたいのでここでは入れない
  ensure_installed = {
    'eslint',
    'gopls',
    'jsonls',
    'lua_ls',
    'rust_analyzer',
    'tsserver',
    'vimls',
    'yamlls',
  },
}

local kmopts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', kmopts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', kmopts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', kmopts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', kmopts)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', kmopts)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', kmopts)
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
  -- 'eslint',
  'flow',
  'gopls',
  'jsonls',
  -- 'lua_ls',
  -- 'ruby_ls',
  'rust_analyzer',
  'sorbet',
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

lspconfig.ruby_ls.setup {
  on_attach = on_attach,
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

------------------------------------------
-- misc
------------------------------------------

-- git
require('neogit').setup {
  mappings = {
    status = {
      ['o'] = 'Toggle',
    },
  },
  disable_commit_confirmation = true,
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
require('scrollbar').setup {}
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
    transparent = true,
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

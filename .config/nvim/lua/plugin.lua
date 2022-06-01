require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'othree/eregex.vim'
  use 'thinca/vim-quickrun'
  -- use 'w0rp/ale'
  use 'nanotech/jellybeans.vim'
  use 'EdenEast/nightfox.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'junegunn/vim-easy-align'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'lewis6991/gitsigns.nvim'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  }
  use 'kevinhwang91/nvim-hlslens'
  use { 'petertriho/nvim-scrollbar', requires = 'kevinhwang91/nvim-hlslens' }

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
  use 'williamboman/nvim-lsp-installer'
  use 'j-hui/fidget.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'simrat39/rust-tools.nvim'

  use {
    'AndrewRadev/vim-eco',
    ft = { 'eco' },
    requires = { { 'kchmck/vim-coffee-script' } },
  }
end)

-- TODO: どれかがインストールされていない場合ここ以降は実行しないようにしたい

local kmopts = { noremap = true, silent = true }

------------------------------------------
-- nvim-cmp
------------------------------------------

local cmp = require 'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
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
    "dockerfile",
    "go",
    "hcl",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "make",
    "perl",
    "python",
    "ruby",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
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
local servers = {
  "rust_analyzer",
  "sumneko_lua",
  "tsserver",
  "eslint",
  "vimls",
  "solargraph",
}

require("nvim-lsp-installer").setup { ensure_installed = servers }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', kmopts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', kmopts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', kmopts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', kmopts)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', kmopts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', kmopts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', kmopts)

  -- js/ts の formatter は null-ls に任せる(これをやっておかないといちいち formatter を選択する必要がある)
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end
end

local lspconfig = require("lspconfig")
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = lsp ~= 'solargraph', -- ruby だけ自動で開始しない
  }
end

-- https://neovim.discourse.group/t/how-to-suppress-warning-undefined-global-vim/1882
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

-- LSP 起動時のステータス表示
require("fidget").setup {}

-- もろもろを LSP と統合するやつ
local null_ls = require("null-ls");
null_ls.setup({
  -- debounce = 250, -- デフォルト 250 が重いときはここをいじる
  sources = {
    -- null_ls.builtins.diagnostics.cspell, -- 重いからいったんやめる
    -- eslint は null-ls で動かすと重いので lsp server のやつを使う
    null_ls.builtins.formatting.prettier.with {
      prefer_local = "node_modules/.bin",
    },
    null_ls.builtins.diagnostics.rubocop.with {
      command = 'bundle',
      args = { 'exec', 'rubocop', '-f', 'json', '--stdin', '$FILENAME' },
    },
    null_ls.builtins.formatting.rubocop.with {
      command = 'bundle',
      args = { 'exec', 'rubocop', '--auto-correct', '-f', 'quiet', '--stderr', '--stdin', '$FILENAME' },
    },
  },
})

require('rust-tools').setup {}

------------------------------------------
-- misc
------------------------------------------

-- git
require('neogit').setup {}
require('gitsigns').setup {}

-- indent
require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}

-- neo-tree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require('neo-tree').setup {
  filesystem = {
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
  window = {
    mappings = {
      ['o'] = 'open',
      ['s'] = 'open_split',
      ['v'] = 'open_vsplit',
    }
  },
}

-- nvim-hlslens
vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kmopts)
vim.api.nvim_set_keymap('n', '<space>l', ':noh<CR>', kmopts)

-- nvim-scrollbar
require('scrollbar').setup {}
require('scrollbar.handlers.search').setup {}

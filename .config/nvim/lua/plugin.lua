require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'othree/eregex.vim'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'gregsexton/gitv' -- depends: vim-fugitive
  use 'thinca/vim-quickrun'
  use 'w0rp/ale'
  use 'nanotech/jellybeans.vim'
  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'junegunn/vim-easy-align'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim' -- depends: [plenary.nvim, nvim-treesitter]

  -- 補完
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  use {
    'AndrewRadev/vim-eco',
    ft = {'eco'},
    requires = {{'kchmck/vim-coffee-script'}},
  }
end)


------------------------------------------
-- nvim-cmp
------------------------------------------

local cmp = require'cmp'

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
    -- { name = 'nvim_lsp' },
    }, {
      { name = 'vsnip' },
      { name = 'buffer' },
      { name = 'path' },
    })
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

require'nvim-treesitter.configs'.setup {
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



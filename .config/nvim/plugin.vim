call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'othree/eregex.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv' " depends: vim-fugitive
Plug 'thinca/vim-quickrun'
Plug 'w0rp/ale'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim' " depends: [plenary.nvim, nvim-treesitter]

" 補完
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp' " depends: vim-vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

Plug 'tyru/open-browser.vim', { 'for': 'markdown' }
Plug 'kannokanno/previm', { 'for': 'markdown' } " depends: open-browser.vim
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee', 'eco'] }
Plug 'AndrewRadev/vim-eco', { 'for': 'eco' } " depends: vim-coffee-script

call plug#end()


"----------------------------------------
" nvim-cmp
"----------------------------------------
set completeopt=menu,menuone,noselect


"----------------------------------------
" eregex
"----------------------------------------
" デフォルトがONだと/とか?に勝手にマッピングされてしまう
let g:eregex_default_enable = 0
let g:eregex_forward_delim = '/'
let g:eregex_backward_delim = '?'


"----------------------------------------
" previm
"----------------------------------------
let g:previm_enable_realtime = 1


"----------------------------------------
" NERDTree
"----------------------------------------
" meta: Unityの管理ファイル
let NERDTreeIgnore     = ['\.o$', '\.pyc$', '\.meta$', '^.DS_Store$']
let NERDTreeShowHidden = 1


"----------------------------------------
" jellybeans
"----------------------------------------
let g:jellybeans_overrides = {
\   'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif


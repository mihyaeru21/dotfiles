" メインは Neovim を使うのでこっちは最低限にしておく

call plug#begin()
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
call plug#end()

"----------------------------------------
" 基本設定
"----------------------------------------
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set textwidth=0
set autoindent
set smartindent
set incsearch
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=0
set backup     " バックアップファイルは作る
set swapfile   " スワップファイルも作る
set ignorecase " 検索語に大文字が無い場合は大文字小文字を無視
set smartcase  " 大文字が入ると大文字小文字を区別
set shiftround " >とかを使った時にきれいな位置に合わせる
set wildmenu   " タブ補完の候補をステータスバーに表示
set wildmode=full  " 補完のしかた？
set history=1000
set tags+=.git/tags " tagsを.git/tagsからも読む

" スワップファイルとバックアップのディレクトリ
set backupdir=~/.vim/backup
let &directory = &backupdir

"----------------------------------------
" 表示
"----------------------------------------
syntax on
set t_Co=256
set background=dark
colorscheme dracula

set showcmd
set showmode
set showmatch
set number
set scrolloff=0
set cursorline
set cmdheight=2
set ambiwidth=double
set laststatus=2
set statusline=[%n]%m%r%f\ %=\ %w%y[%{&fenc}:%{&ff}][%l/%L,%c]
set hlsearch
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<

"----------------------------------------
" map
"----------------------------------------
imap <C-a> <Home>
imap <C-e> <End>
nnoremap <Space>s :sp<CR>
nnoremap <Space>v :vsp<CR>
nnoremap <C-w><C-h> 5<C-w><  " ウィンドウ横を小さく
nnoremap <C-w><C-j> 5<C-w>-  " ウィンドウ縦を小さく
nnoremap <C-w><C-k> 5<C-w>+  " ウィンドウ縦を大きく
nnoremap <C-w><C-l> 5<C-w>>  " ウィンドウ横を大きく
cnoremap <C-p> <Up> " コマンドモードで途中入力履歴呼び出し
cnoremap <C-n> <Down> " コマンドモードで途中入力履歴呼び出し
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nmap <Space>t [tab] " タブ操作
nnoremap [tab]t :tabnew<CR>
nnoremap [tab]n :tabnext<CR>
nnoremap [tab]p :tabprevious<CR>
nnoremap <C-]> g<C-]>
nnoremap <Space>n :NERDTreeToggle<CR>


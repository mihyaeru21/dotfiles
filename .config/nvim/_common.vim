set encoding=utf-8

set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set textwidth=0
set tags+=.git/tags " tagsを.git/tagsからも読む

set autoindent
set smartindent

set hlsearch
set incsearch

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=0

set ignorecase     " 検索語に大文字が無い場合は大文字小文字を無視
set smartcase      " 大文字が入ると大文字小文字を区別
set shiftround     " >とかを使った時にきれいな位置に合わせる

set wildmenu       " タブ補完の候補をステータスバーに表示
set wildmode=full  " 補完のしかた？
set history=1000
set hidden

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
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<
" 邪魔だから無効にする
set mouse=

set inccommand=split

colorscheme jellybeans

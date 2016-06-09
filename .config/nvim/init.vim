"TODO: 要素ごとにファイル分けて綺麗にする

if &compatible
  set nocompatible
endif

set runtimepath^=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.config/nvim/bundle')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:nvim_dir = expand('~/.config/nvim')
  call dein#load_toml(s:nvim_dir . '/dein.toml',      {'lazy' : 0})
  call dein#load_toml(s:nvim_dir . '/dein_lazy.toml', {'lazy' : 1})

  call dein#end()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif


set number
colorscheme jellybeans


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
set ignorecase " 検索語に大文字が無い場合は大文字小文字を無視
set smartcase  " 大文字が入ると大文字小文字を区別
set shiftround " >とかを使った時にきれいな位置に合わせる
set wildmenu   " タブ補完の候補をステータスバーに表示
set wildmode=full  " 補完のしかた？
set history=1000

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
" 邪魔だから無効にする
set mouse=




nnoremap <Space>n :NERDTreeToggle<CR>

nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap [unite]b  :<C-u>Unite buffer -start-insert<CR>
nnoremap [unite]m  :<C-u>Unite file_mru -start-insert<CR>
nnoremap [unite]a  :<C-u>UniteWithBufferDir -buffer-name=file buffer file_mru bookmark file -start-insert<CR>
nnoremap [unite]l  :<C-u>Unite line -start-insert<CR>
nnoremap [unite]o  :<C-u>Unite outline -start-insert<CR>
nnoremap [unite]M  :<C-u>Unite mark -start-insert<CR>
nnoremap [unite]r  :<C-u>UniteResume -start-insert<CR>
nnoremap [unite]fg :<C-u>Unite file_rec/git -start-insert<CR>
nnoremap [unite]fa :<C-u>Unite file_async/git -start-insert<CR>

nnoremap <Space>s :sp<CR>
nnoremap <Space>v :vsp<CR>
nnoremap <C-w><C-h> 5<C-w><  " ウィンドウ横を小さく
nnoremap <C-w><C-j> 5<C-w>-  " ウィンドウ縦を小さく
nnoremap <C-w><C-k> 5<C-w>+  " ウィンドウ縦を大きく
nnoremap <C-w><C-l> 5<C-w>>  " ウィンドウ横を大きく
" コマンドモードで途中入力履歴呼び出し
cnoremap <C-p> <Up>
" コマンドモードで途中入力履歴呼び出し
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" タブ操作周り
nmap <Space>t [tab]
nnoremap [tab]t :tabnew<CR>
nnoremap [tab]n :tabnext<CR>
nnoremap [tab]p :tabprevious<CR>
nnoremap <C-]> g<C-]>

" <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" incsearch.vim の設定
" 標準の /, ?, g/ を置き換える
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)




"----------------------------------------
" neosnippet
"----------------------------------------
let g:neosnippet#snippets_directory = '~/.snippet/'

" デフォルトがONだと/とか?に勝手にマッピングされてしまう
let g:eregex_default_enable = 0
let g:eregex_forward_delim = '/'
let g:eregex_backward_delim = '?'


"----------------------------------------
" previm
"----------------------------------------
let g:previm_enable_realtime = 1



"----------------------------------------
" vim-go
"----------------------------------------
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_structs           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_sonstraints = 1



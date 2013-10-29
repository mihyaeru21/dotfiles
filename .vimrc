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
set backup    " バックアップファイルは作る
set swapfile  " スワップファイルも作る

" スワップファイルとバックアップのディレクトリ
set backupdir=~/.vim_backup
let &directory = &backupdir

" OSの種類
let ostype = system("uname") 

" クリップボードの設定
if ostype == "Linux\n"
    set clipboard=unnamedplus
elseif ostype == "Darwin\n"
    set clipboard=unnamed
endif


"----------------------------------------
" 表示
"----------------------------------------
colorscheme pablo
syntax on
set showcmd
set showmode
set showmatch
set number
set scrolloff=5
set cursorline
set cmdheight=2
set ambiwidth=double
set laststatus=2
set statusline=[%n]%m%r%f\ %=\ %w%y[%{&fenc}:%{&ff}][%l/%L,%c]
set hlsearch


"----------------------------------------
" map
"----------------------------------------
imap <C-a> <Home>
imap <C-e> <End>
nnoremap <Space>s :sp<CR>
nnoremap <Space>v :vsp<CR>


"----------------------------------------
" color
"----------------------------------------
"highligh Pmenu ctermbg=8
"highligh PmenuSel ctermbg=1
"highligh PmenuSbar ctermbg=0


"----------------------------------------
" filetype
"----------------------------------------
autocmd BufNewFile,BufRead *.md set filetype=markdown


"----------------------------------------
" NeoBundle
"----------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" 推奨らしい
NeoBundle 'Shougo/vimproc', {
\   'build' : {
\       'windows' : 'make -f make_mingw32.mak',
\       'cygwin'  : 'make -f make_cygwin.mak',
\       'mac'     : 'make -f make_mac.mak',
\       'unix'    : 'make -f make_unix.mak',
\   },
\ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'

filetype plugin on  " Required
filetype indent on  " Required


"----------------------------------------
" NeoComplcach
"----------------------------------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_auto_completion_start_length=2


"----------------------------------------
" Unite.vim
"----------------------------------------
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap [unite]b :<C-u>Unite buffer<CR>
nnoremap [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap [unite]r :<C-u>Unite -buffer-name=register<CR>
nnoremap [unite]m :<C-u>Unite file_mru<CR>
nnoremap [unite]u :<C-u>Unite buffer file_mru<CR>
nnoremap [unite]a :<C-u>UniteWithBufferDir -fuffer-name=file buffer file_mru bookmark file<CR>


"----------------------------------------
" quickrun
"----------------------------------------
let g:quickrun_config = {
\   '_' : {
\       'outputter/buffer/split' : ':botright 8sp',
\       'runner' : 'vimproc',
\       'runner/vimproc/updatetime' : 40,
\       'hook/time/enable' : 1,
\   }
\}


" プラグイン周りを先に読み込む
source ~/dotfiles/.vimrc.bundle

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

" スワップファイルとバックアップのディレクトリ
set backupdir=~/.vim_backup
let &directory = &backupdir

" OSの種類
let ostype = system("uname") 

" クリップボードの設定
if ostype == "Linux\n"
    set clipboard=unnamedplus
elseif ostype == "Darwin\n"
    set clipboard=unnamed,autoselect
endif


"----------------------------------------
" 表示
"----------------------------------------
colorscheme jellybeans
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
nnoremap <C-w><C-h> 5<C-w><  " ウィンドウ横を小さく
nnoremap <C-w><C-j> 5<C-w>-  " ウィンドウ縦を小さく
nnoremap <C-w><C-k> 5<C-w>+  " ウィンドウ縦を大きく
nnoremap <C-w><C-l> 5<C-w>>  " ウィンドウ横を大きく


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
autocmd BufNewFile,BufRead *.podspec set filetype=ruby
autocmd BufNewFile,BufRead Podfile set filetype=ruby

" Perl
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t setfiletype perl
    autocmd! BufNewFile,BufRead *.psgi setfiletype perl
    autocmd! BufNewFile,BufRead *.tt setfiletype perl
    autocmd! BufNewFile,BufRead *.tx setfiletype xslate
augroup END


"----------------------------------------
" NeoComplcach
"----------------------------------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_auto_completion_start_length=2


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


"----------------------------------------
" プラグイン用マッピング
"----------------------------------------
" Unite.vim
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap [unite]b :<C-u>Unite buffer<CR>
nnoremap [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap [unite]r :<C-u>Unite -buffer-name=register<CR>
nnoremap [unite]m :<C-u>Unite file_mru<CR>
nnoremap [unite]u :<C-u>Unite buffer file_mru<CR>
nnoremap [unite]a :<C-u>UniteWithBufferDir -fuffer-name=file buffer file_mru bookmark file<CR>

nnoremap <Space>n :NERDTree<CR>
nnoremap <Space>r :<C-u>QuickRun -mode n<CR>
vnoremap <Space>r :<C-u>QuickRun -mode n<CR>


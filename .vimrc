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
set wildmenu   " タブ補完の候補をステータスバーに表示
set wildmode=full  " 補完のしかた？
set history=1000

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
set scrolloff=0
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
autocmd BufNewFile,BufRead *.gp set filetype=gnuplot
autocmd BufNewFile,BufRead *.tex set filetype=tex  " plaintexになるのを防ぐ

" Perl
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t setfiletype perl
    autocmd! BufNewFile,BufRead *.psgi setfiletype perl
    autocmd! BufNewFile,BufRead *.tt setfiletype perl
    autocmd! BufNewFile,BufRead *.tx setfiletype xslate
augroup END

" CoffeeScript
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.coffee setfiletype coffee
augroup END


"----------------------------------------
" markdown中でハイライトさせたい言語
"----------------------------------------
let g:markdown_fenced_languages = [
\  'python',
\  'perl',
\  'ruby',
\  'vim',
\  'lisp',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'coffee',
\  'xml',
\  'html',
\  'css',
\  'sh',
\  'zsh',
\  'sql',
\]

"----------------------------------------
" NeoComplete
"----------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Perl用
" c9s/perlomni.vimに依存？
" let g:neocomplete#sources#omni#input_patterns.perl = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"----------------------------------------
" ag でvim grep
"----------------------------------------
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

nnoremap [ag] <Nop>
nmap <Space>a [ag]

" grep検索
nnoremap [ag]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap [ag]c :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap [ag]r :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column ' .
        \  '--ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore ''local'''
    let g:unite_source_grep_recursive_opt = ''
endif


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
" Gist-vim
"----------------------------------------
let g:gist_show_privates = 1  " secret gistを表示する
let g:gist_post_private = 1   " デフォルトでsecretにする


"----------------------------------------
" neosnippet
"----------------------------------------
let s:my_snippet = '~/.snippet/'
let g:neosnippet#snippets_directory = s:my_snippet


"----------------------------------------
" neosnippet
"----------------------------------------
" デフォルトがONだと/とか?に勝手にマッピングされてしまう
let g:eregex_default_enable = 0
let g:eregex_forward_delim = '/'
let g:eregex_backward_delim = '?'

"----------------------------------------
" プラグイン用マッピング
"----------------------------------------
" Unite.vim
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap [unite]b :<C-u>Unite buffer<CR>
nnoremap [unite]ff :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap [unite]r :<C-u>Unite -buffer-name=register<CR>
nnoremap [unite]m :<C-u>Unite file_mru<CR>
nnoremap [unite]u :<C-u>Unite buffer file_mru<CR>
nnoremap [unite]a :<C-u>UniteWithBufferDir -buffer-name=file buffer file_mru bookmark file<CR>
nnoremap [unite]g :<C-u>Unite ghq<CR>
nnoremap [unite]l :<C-u>Unite line<CR>
nnoremap [unite]o :<C-u>Unite outline<CR>
nnoremap [unite]t :<C-u>Unite tag<CR>
nnoremap [unite]M :<C-u>Unite mark<CR>
nnoremap [unite]r :<C-u>UniteResume<CR>
nnoremap [unite]fg :<C-u>Unite file_rec/git -start-insert<CR>
nnoremap [unite]fa :<C-u>Unite file_async/git -start-insert<CR>

nnoremap [unite]pb :<C-u>Unite buffer -auto-preview<CR>
nnoremap [unite]pl :<C-u>Unite line -auto-preview<CR>
nnoremap [unite]po :<C-u>Unite outline -auto-preview<CR>
nnoremap [unite]pM :<C-u>Unite mark -auto-preview<CR>

nnoremap <Space>n :NERDTreeToggle<CR>
nnoremap <Space>r :<C-u>QuickRun -mode n<CR>
vnoremap <Space>r :<C-u>QuickRun -mode n<CR>
nnoremap <Space>g :Gitv<CR>

" Vimplenote には o オプションはないらしい
" command ToDo VimpleNote -o 7d4d2bd7df6211e3a30a97fd17d6c4e4

" gitv
autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
    nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction

autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
    if &filetype ==# 'git'
        setlocal foldenable!
    endif
endfunction

" <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" incsearch.vim の設定
" 標準の /, ?, g/ を置き換える
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

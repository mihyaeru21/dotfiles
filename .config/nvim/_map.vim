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


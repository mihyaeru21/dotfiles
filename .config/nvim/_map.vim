"----------------------------------------
" プラグイン以外のマッピング
"----------------------------------------
" ウィンドウ操作
nnoremap <Space>s :sp<CR>
nnoremap <Space>v :vsp<CR>
nnoremap <C-w><C-h> 5<C-w><  " ウィンドウ横を小さく
nnoremap <C-w><C-j> 5<C-w>-  " ウィンドウ縦を小さく
nnoremap <C-w><C-k> 5<C-w>+  " ウィンドウ縦を大きく
nnoremap <C-w><C-l> 5<C-w>>  " ウィンドウ横を大きく

" タブ操作
nmap <Space>t [tab]
nnoremap [tab]t :tabnew<CR>
nnoremap [tab]n :tabnext<CR>
nnoremap [tab]p :tabprevious<CR>

" <C-]>だけだとジャンプ先タグが複数あった場合に見逃す
nnoremap <C-]> g<C-]>

" コマンドモードで途中入力履歴呼び出し
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" 現在開いているバッファのパスを展開する
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


"----------------------------------------
" Denite
"----------------------------------------
nnoremap [denite] <Nop>
nmap <Space>u [denite]
nnoremap [denite]b :<C-u>Denite buffer<CR>
nnoremap [denite]m :<C-u>Denite file_mru<CR>
nnoremap [denite]l :<C-u>Denite line<CR>
nnoremap [denite]o :<C-u>Denite outline<CR>
nnoremap [denite]r :<C-u>Denite -resume<CR>
nnoremap [denite]f :<C-u>Denite file/rec<CR>
nnoremap [denite]g :<C-u>Denite grep<CR>


"----------------------------------------
" NERDTree
"----------------------------------------
nnoremap <Space>n :NERDTreeToggle<CR>


"----------------------------------------
" NeoSnippet
"----------------------------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)


"----------------------------------------
" quickrun
"----------------------------------------
nnoremap <Space>r :<C-u>QuickRun -mode n<CR>
vnoremap <Space>r :<C-u>QuickRun -mode n<CR>


"----------------------------------------
" incsearch
"----------------------------------------
" 標準の /, ?, g/ を置き換える
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)


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
" NERDTree
"----------------------------------------
nnoremap <Space>n :NERDTreeToggle<CR>


"----------------------------------------
" quickrun
"----------------------------------------
nnoremap <Space>r :<C-u>QuickRun -mode n<CR>
vnoremap <Space>r :<C-u>QuickRun -mode n<CR>


autocmd FileType rust,ruby,python nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd FileType rust,ruby,python nnoremap <buffer> <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>


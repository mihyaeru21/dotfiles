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


"----------------------------------------
" telescope
"----------------------------------------
nmap <Space>u [telescope]
nnoremap [telescope]f :Telescope find_files<CR>
nnoremap [telescope]m :Telescope oldfiles<CR>
nnoremap [telescope]g :Telescope live_grep<CR>
nnoremap [telescope]wg :Telescope grep_string<CR>
nnoremap [telescope]t :Telescope treesitter<CR>
nnoremap [telescope]d :Telescope diagnostics<CR>
nnoremap [telescope]b :Telescope buffers<CR>
nnoremap [telescope]r :Telescope resume<CR>
nnoremap [telescope]ld :Telescope lsp_definitions<CR>
nnoremap [telescope]lr :Telescope lsp_references<CR>
nnoremap [telescope]li :Telescope lsp_implementations<CR>
nnoremap [telescope]lsd :Telescope lsp_document_symbols<CR>
nnoremap [telescope]lsw :Telescope lsp_workspace_symbols<CR>


nnoremap <Space>g :Neogit<CR>



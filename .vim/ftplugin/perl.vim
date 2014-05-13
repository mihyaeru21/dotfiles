set expandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4

" 整形ツールを使う
vnoremap <Space>pt <Esc>:'<,'>! perltidy -se<CR>

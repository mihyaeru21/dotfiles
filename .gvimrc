let ostype = system("uname") 
if ostype == "Linux\n"
    set guifont=Ricty\ Regular\ 14
elseif ostype == "Darwin\n"
    set guifont=Ricty\ Discord\ Regular:h14
endif

set guioptions-=T  " ツールバーを表示しない
set guioptions-=r  " 右スクロールバーを表示しない
set guioptions-=L  " 左スクロールバーを表示しない

" インサートモードを抜けると同時にIMEオフ
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" ベルを鳴らさない
set visualbell t_vb=

colorscheme desert

" これをやっておかないと日本語入力が厳しい
" http://loumo.jp/wp/archive/20160914120009/
set imdisable


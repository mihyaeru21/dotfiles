let ostype = system("uname") 
if ostype == "Linux\n"
    set guifont=Ricty\ Regular\ 14
elseif ostype == "Darwin\n"
    set guifont=Inconsolata:h16
    set guifontwide=Migu\ 1M\ Regular:h16
endif

set guioptions-=T  " ツールバーを表示しない
set guioptions-=r  " 右スクロールバーを表示しない

" インサートモードを抜けると同時にIMEオフ
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>


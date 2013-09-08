colorscheme torte

let ostype = system("uname") 
if ostype == "Linux\n"
    set guifont=Ricty\ Regular\ 14
    set guioptions-=T
    set guioptions-=r
endif

" インサートモードを抜けると同時にIMEオフ
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>


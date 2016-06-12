source ~/dotfiles/.config/nvim/_dein.vim
source ~/dotfiles/.config/nvim/_common.vim
source ~/dotfiles/.config/nvim/_map.vim
source ~/dotfiles/.config/nvim/_filetype.vim

"----------------------------------------
" neosnippet
"----------------------------------------
let g:neosnippet#snippets_directory = '~/.snippet/'

" デフォルトがONだと/とか?に勝手にマッピングされてしまう
let g:eregex_default_enable = 0
let g:eregex_forward_delim = '/'
let g:eregex_backward_delim = '?'


"----------------------------------------
" previm
"----------------------------------------
let g:previm_enable_realtime = 1



"----------------------------------------
" vim-go
"----------------------------------------
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_structs           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_sonstraints = 1






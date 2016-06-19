
"----------------------------------------
" neosnippet
"----------------------------------------
let g:neosnippet#snippets_directory = '~/.snippet/'


"----------------------------------------
" eregex
"----------------------------------------
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


"----------------------------------------
" NERDTree
"----------------------------------------
" meta: Unityの管理ファイル
let NERDTreeIgnore     = ['\.pyc$', '\.meta$', '^.DS_Store$']
let NERDTreeShowHidden = 1


"----------------------------------------
" Syntastic
"----------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
\   'mode'             : 'passive',
\   'active_filetypes' : ['ruby'],
\}


"----------------------------------------
" deoplete
"----------------------------------------
let g:deoplete#enable_smart_case = 1


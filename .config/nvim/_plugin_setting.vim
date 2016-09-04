
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
" Neomake
"----------------------------------------
let g:neomake_open_list          = 0  " 0:なし, 1:開く, 2:リストは開くけどカーソルは元の位置のまま
let g:neomake_list_height        = 5  " 今は表示しないけど表示するなら5行にしたい
let g:neomake_echo_current_error = 1
autocmd! BufWritePost * Neomake


"----------------------------------------
" deoplete
"----------------------------------------
let g:deoplete#enable_smart_case = 1


"----------------------------------------
" quickrun
"----------------------------------------
let g:quickrun_config = {
\   '_' : {
\       'outputter/buffer/split' : ':botright 8sp',
\       'runner' : 'vimproc',
\       'runner/vimproc/updatetime' : 40,
\       'hook/time/enable' : 1,
\   },
\   'coffee' : {
\       'command' : 'coffee',
\       'exec'    : ['%c %s'],
\   },
\   'swift' : {
\       'command' : 'swift',
\       'exec'    : ['%c %s'],
\   },
\   'haskell' : {
\       'command' : 'stack',
\       'exec'    : ['%c runhaskell -- %s'],
\   },
\}


"----------------------------------------
" Unite
"----------------------------------------
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case  = 1

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
    let g:unite_source_grep_command       = 'ag'
    let g:unite_source_grep_default_opts  = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif


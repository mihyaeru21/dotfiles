
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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_enable_signs             = 1
let g:syntastic_error_symbol             = '✗'
let g:syntastic_warning_symbol           = '⚠'
let g:syntastic_style_error_symbol       = 'S✗'
let g:syntastic_style_warning_symbol     = 'S⚠'
let g:syntastic_mode_map = {
\   'mode'             : 'passive',
\   'active_filetypes' : ['ruby', 'haskell', 'python'],
\}

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


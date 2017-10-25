
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
let NERDTreeIgnore     = ['\.o$', '\.pyc$', '\.meta$', '^.DS_Store$']
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

if !exists('g:deoplete#sources')
    let g:deoplete#sources = {}
endif
let g:deoplete#sources.rust = ['buffer', 'tag', 'racer']

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
" Denite
"----------------------------------------

" denite grep に ag を使う
if executable('ag')
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif

call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

"----------------------------------------
" vim-jsx
"----------------------------------------

" @から始まるプラグマでは読み込まない
let g:jsx_pragma_required = 0


"----------------------------------------
" Rust
"----------------------------------------
" rust.vim
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
let g:rust_fold = 1


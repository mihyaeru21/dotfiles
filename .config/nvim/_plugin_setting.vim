
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
" deoplete
"----------------------------------------
let g:deoplete#enable_smart_case = 1

if !exists('g:deoplete#sources')
    let g:deoplete#sources = {}
endif


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

if executable('rg')
    call denite#custom#var('grep', 'command', ['rg', '--threads', '4'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--hidden', '--glob', '!.git'])
endif

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <TAB> denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> o denite#do_map('open_filter_buffer')
endfunction

call denite#custom#option('default', {
\   'prompt' : '/ ',
\})

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


"----------------------------------------
" LanguageClient-neovim
"----------------------------------------

let g:LanguageClient_serverCommands = {
\   'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
\   'python': ['~/.local/bin/pyls'],
\}


"----------------------------------------
" jellybeans
"----------------------------------------

let g:jellybeans_overrides = {
\   'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif


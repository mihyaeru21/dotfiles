if &compatible
  set nocompatible
endif
set runtimepath^=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/bundle'))

call dein#add('Shougo/deoplete.nvim')
call dein#add('nanotech/jellybeans.vim')

call dein#end()

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif


set number
colorscheme jellybeans

let g:deoplete#enable_at_startup = 1


if &compatible
  set nocompatible
endif

set runtimepath^=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.config/nvim/bundle')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:nvim_dir = expand('~/.config/nvim')
  call dein#load_toml(s:nvim_dir . '/dein.toml',      {'lazy' : 0})
  call dein#load_toml(s:nvim_dir . '/dein_lazy.toml', {'lazy' : 1})

  call dein#end()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif


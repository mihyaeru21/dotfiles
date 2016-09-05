source ~/dotfiles/.config/nvim/_dein.vim
source ~/dotfiles/.config/nvim/_common.vim
source ~/dotfiles/.config/nvim/_map.vim
source ~/dotfiles/.config/nvim/_filetype.vim
source ~/dotfiles/.config/nvim/_plugin_setting.vim

if filereadable(expand('~/dotfiles/.config/nvim/_local.vim'))
    source ~/dotfiles/.config/nvim/_local.vim
endif


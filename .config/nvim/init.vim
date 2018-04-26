source ~/dotfiles/.config/nvim/_dein.vim
source ~/dotfiles/.config/nvim/_common.vim
source ~/dotfiles/.config/nvim/_map.vim
source ~/dotfiles/.config/nvim/_plugin_setting.vim

if filereadable(expand('~/dotfiles/local/nvim.vim'))
    source ~/dotfiles/local/nvim.vim
endif


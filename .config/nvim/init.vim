source ~/dotfiles/.config/nvim/plugin.vim
lua require('config.lazy')
lua require('config.general')
source ~/dotfiles/.config/nvim/general.vim
source ~/dotfiles/.config/nvim/mapping.vim

if filereadable(expand('~/dotfiles/local/nvim.vim'))
    source ~/dotfiles/local/nvim.vim
endif


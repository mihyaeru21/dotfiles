# 入っていない場合にインストールする
antidote_dir=$HOME/dotfiles/zsh/antidote
if [[ ! -e $antidote_dir/antidote.zsh ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
fi

zstyle ':antidote:bundle' file $HOME/dotfiles/zsh/plugins.txt
zstyle ':antidote:static' file $HOME/dotfiles/zsh/plugins.zsh
zstyle ':antidote:static' zcompile on
source $antidote_dir/antidote.zsh
antidote load

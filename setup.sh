#!/bin/bash

DOT_FILES=(.gitconfig .gitignore .gvimrc .tmux.conf .vim .vimrc .zsh .zshrc)

for file in ${DOT_FILES[@]}
do
    if [ -f $HOME/$file ]; then
        echo $HOME/$file 'already exists'
    elif [ -d $HOME/$file ]; then
        echo $HOME/$file 'already exists'
    else
        ln -s $HOME/dotfiles/$file $HOME/$file
        echo $HOME/$file 'symbolid link created'
    fi
done

# install NeoBundle
if [ ! -d .vim/bundle ]; then
    mkdir -p .vim/bundle
    git clone git://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim
else
    echo 'NeoBundle already exists'
fi


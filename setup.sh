#!/bin/bash

DOT_FILES=(.gitignore)

for file in ${DOT_FILES[@]}
do
    echo $file
done

# install NeoBundle
if [ ! -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi


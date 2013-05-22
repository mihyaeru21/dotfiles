#!/bin/bash

DOT_FILES=(.vimrc .gvimrc)

for file in ${DOT_FILES[@]}
do
    echo $file
done

# install NeoBundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim


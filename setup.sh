#!/bin/bash

#
# create symbolic link
#
DOT_FILES=(.gitconfig .gitignore .gvimrc .tmux.conf .vim .vimrc .zsh .zshrc .zprofile .ctags .slate .perltidyrc .proverc .snippet)
for file in ${DOT_FILES[@]}; do
    if [ -f $HOME/$file ]; then
        echo $HOME/$file 'already exists'
    elif [ -d $HOME/$file ]; then
        echo $HOME/$file 'already exists'
    else
        ln -s $HOME/dotfiles/$file $HOME/$file
        echo $HOME/$file 'symbolic link created'
    fi
done


#
# copy local files
#
LOCAL_FILES=(.zshrc.local .zprofile.local .gitconfig.local)
for local_file in ${LOCAL_FILES[@]}; do
    if [ -f $HOME/$local_file ]; then
        echo $HOME/$local_file 'already exists'
    else
        cp $HOME/dotfiles/"${local_file}.sample" $HOME/$local_file
        echo "copy ${local_file} to home directory"
    fi
done


#
# Vim
#

# バックアップ用ディレクトリ
if [ -d $HOME/.vim_backup ]; then
    echo 'vim backup already exists'
else
    mkdir $HOME/.vim_backup
    echo 'create vim backup'
fi

# install NeoBundle
if [ -d .vim/bundle ]; then
    echo 'NeoBundle already exists'
else
    mkdir -p .vim/bundle
    git clone git://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim
fi


#
# anyenv
#
if [ -d $HOME/.anyenv ]; then
    echo 'anyenv already exists'
else
    echo 'Installing anyenv...'
    git clone https://github.com/riywo/anyenv $HOME/.anyenv
fi

anyenv_plugin_root=$HOME/.anyenv/plugins
if [ -d $anyenv_plugin_root ]; then
    echo 'anyenv update already exists'
else
    mkdir -p $anyenv_plugin_root
    git clone https://github.com/znz/anyenv-update.git $anyenv_plugin_root/anyenv-update
fi


#
# antigen
#
if [ -d $HOME/.antigen ]; then
    echo 'antigen already exists'
else
    echo 'Installing antigen...'
    git clone https://github.com/zsh-users/antigen.git $HOME/.antigen
fi


echo 'setup complete!!!'


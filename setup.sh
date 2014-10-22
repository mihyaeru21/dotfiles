#!/bin/bash

#
# create symbolic link
#
DOT_FILES=(.gitconfig .gitignore .gvimrc .tmux.conf .vim .vimrc .zsh .zshrc .zprofile .ctags .slate .perltidyrc .proverc .snippet)
for file in ${DOT_FILES[@]}
do
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
for local_file in ${LOCAL_FILES[@]}
do
    if [ ! -f $HOME/$local_file ]
    then
        cp $HOME/dotfiles/"${local_file}.sample" $HOME/$local_file
        echo "copy ${local_file} to home directory"
    else
        echo $HOME/$local_file 'already exists'
    fi
done


#
# Vim
#

# バックアップ用ディレクトリ
if [ ! -d $HOME/.vim_backup ]
then
    mkdir $HOME/.vim_backup
    echo 'create vim backup'
else
    echo 'vim backup already exists'
fi

# install NeoBundle
if [ ! -d .vim/bundle ]
then
    mkdir -p .vim/bundle
    git clone git://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim
else
    echo 'NeoBundle already exists'
fi


#
# anyenv
#
if [ ! -d $HOME/.anyenv ]
then
    echo 'Installing anyenv...'
    git clone https://github.com/riywo/anyenv ~/.anyenv
else
    echo 'anyenv already exists'
fi

anyenv_plugin_root=$(anyenv root)/plugins
if [ ! -d $anyenv_plugin_root ]
then
    mkdir -p $anyenv_plugin_root
    git clone https://github.com/znz/anyenv-update.git $anyenv_plugin_root/anyenv-update
else
    echo 'anyenv update already exists'
fi


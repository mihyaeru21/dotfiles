#!/bin/bash

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


#
# tpm (tmux plugin manager)
#
if [ -d $HOME/.tmux/plugins/tpm ]; then
    echo 'tpm already exists'
else
    echo 'Installing tpm...'
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


echo 'setup complete!!!'


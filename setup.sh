#!/bin/bash


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


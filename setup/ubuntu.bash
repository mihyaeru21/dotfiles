#!/bin/bash -ex

# デフォルトは nano になっているので vim に変える
sudo update-alternatives --set editor /usr/bin/vim.basic

# 更新していろいろ入れる
sudo apt update && sudo apt upgrade -y
sudo apt install -y make git curl zsh dirmngr gpg gawk tmux unzip wget dstat language-pack-ja-base
sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev # for ruby

# zsh が動く環境向けの設定を実行する
./setup/common.zsh


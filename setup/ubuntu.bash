#!/bin/bash -ex

# sudo でパスワードを不要にする(必要ならあとで visudo して消す)
set +e
configured=$(sudo -l -U "$USER" 2>/dev/null | grep -c NOPASSWD)
set -e
if [ "$configured" -eq 0 ]; then
    echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo
fi

# デフォルトは nano になっているので vim に変える
sudo update-alternatives --set editor /usr/bin/vim.basic

# 更新していろいろ入れる
sudo apt update && sudo apt upgrade -y
sudo apt install -y make cmake git curl zsh dirmngr gpg gawk tmux unzip wget dstat language-pack-ja-base pkg-config jq shellcheck shfmt
sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev libsqlite3-dev libmysqlclient-dev libmagic-dev # for ruby

# zsh が動く環境向けの設定を実行する
./setup/common.zsh


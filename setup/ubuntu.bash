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
sudo apt install -y make cmake git curl zsh dirmngr gpg gawk tmux unzip wget dstat language-pack-ja-base pkg-config jq shellcheck shfmt ca-certificates ripgrep fd-find bat eza hexyl procs git-delta du-dust gron tmuxp
sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev libsqlite3-dev libmysqlclient-dev libmagic-dev # for ruby

# docker
set +e
command -v docker >/dev/null 2>&1
docker_exists=$?
set -e
if [ $docker_exists -ne 0 ]; then
    # from https://docs.docker.com/engine/install/ubuntu/

    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo usermod -aG docker "$USER"
fi

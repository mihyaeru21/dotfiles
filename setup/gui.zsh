#!/usr/bin/zsh -ex

# GUI 環境向け
# ただし Ubuntu 系は ubuntu-gui.zsh に記述

systemctl --user enable ssh-agent
systemctl --user start ssh-agent

#!/usr/bin/zsh -ex

# GUI 環境向け

systemctl --user enable ssh-agent
systemctl --user start ssh-agent

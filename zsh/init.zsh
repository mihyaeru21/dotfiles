# mise を先に読んでおかないと各種ツールが見えないため他の設定でコケるケースがある
if [ -e ~/.local/bin/mise ]; then
    eval "$(~/.local/bin/mise activate zsh)"
fi

# asdf を先に読んでおかないと各種ツールが見えないため他の設定でコケるケースがある
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)


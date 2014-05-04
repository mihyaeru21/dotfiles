# 環境ごとの設定ファイルを読み込む
[ -f ~/.zprofile.local ] && source ~/.zprofile.local

# anyenv
# PATHに既に 'anyenv' が含まれている時は何もしない
if [ -d ~/.anyenv ] && ! echo $PATH | grep -q 'anyenv'
then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init - zsh)"
fi


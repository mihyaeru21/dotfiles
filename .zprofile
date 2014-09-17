# 環境ごとの設定ファイルを読み込む
[ -f ~/.zprofile.local ] && source ~/.zprofile.local

# anyenv
if [ -d "$HOME/.anyenv" ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    for env_name in `ls $HOME/.anyenv/envs` ; do
        export PATH="$HOME/.anyenv/envs/$env_name/shims:$PATH"
    done
    eval "$(anyenv init - zsh)"
fi

# Go
export GOPATH=$HOME/.go
export PATH="$PATH:$GOPATH/bin"

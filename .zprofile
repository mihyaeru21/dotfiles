# 環境ごとの設定ファイルを読み込む
[ -f ~/.zprofile.local ] && source ~/.zprofile.local

# いろいろ入れておくところ
export PATH="$PATH:$HOME/dotfiles/.bin"

# anyenv
# tmuxを噛ませた時にshimsがおかしくなるから手動で設定しないといけない
if [ -d "$HOME/.anyenv" ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    for env_name in `ls $HOME/.anyenv/envs` ; do
        export PATH="$HOME/.anyenv/envs/$env_name/shims:$PATH"
    done
    eval "$(anyenv init - zsh)"
fi

# pyenv
# TODO: いずれpyenvは使わずにpython自体のvirtualenvを使うようにしたい
if [ -d "$HOME/.anyenv/envs/pyenv/plugins/pyenv-virtualenv" ] ; then
    eval "$(pyenv virtualenv-init - zsh)"
fi

# Go
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# Haskell
export PATH="$PATH:$HOME/.local/bin"

# Javaのデフォルトの文字コードを設定する
export JAFA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

# Mac用の設定
if uname | grep Darwin > /dev/null ; then
    source $HOME/dotfiles/.zsh/zprofile.mac
fi

# Linux用の設定
if uname | grep Linux > /dev/null ; then
    source $HOME/dotfiles/.zsh/zprofile.linux
fi


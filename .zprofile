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

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# ここが読み込まれた時点でのtoolchainの向き先になってしまうけど、しばらくはtoolchainは変えることは無さそうだから許容
# これがリリースされるまでの間のみ必要: https://github.com/phildawes/racer/pull/598
rust_sysroot=`rustc --print sysroot`
export RUST_SRC_PATH="$rust_sysroot/lib/rustlib/src/rust/src"

# Haskell
export PATH="$PATH:$HOME/.local/bin"

# Javaのデフォルトの文字コードを設定する
export JAFA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

# Mac用の設定
if uname | grep Darwin > /dev/null ; then
    source $HOME/dotfiles/.zsh/zprofile.mac.zsh
fi

# Linux用の設定
if uname | grep Linux > /dev/null ; then
    source $HOME/dotfiles/.zsh/zprofile.linux.zsh
fi

# El Capitan以上ではやっておくとようさそう感
# https://github.com/servo/servo/ より
export OPENSSL_INCLUDE_DIR="$(brew --prefix openssl)/include"
export OPENSSL_LIB_DIR="$(brew --prefix openssl)/lib"


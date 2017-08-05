# fisherでインストールするディレクトリを変更
set -U fish_path ~/dotfiles/fisher

# # 環境ごとの設定ファイルを読み込む
# [ -f ~/.zprofile.local ] && source ~/.zprofile.local

# FIXME: これいらんな移行完了後に消すぞ
set -x PATH /usr/local/bin /usr/local/sbin $PATH

# いろいろ入れておくところ
set -x PATH $PATH $HOME/dotfiles/.bin

# # anyenv
# # tmuxを噛ませた時にshimsがおかしくなるから手動で設定しないといけない
# if [ -d "$HOME/.anyenv" ] ; then
#     set -x PATH "$HOME/.anyenv/bin:$PATH"
#     for env_name in `ls $HOME/.anyenv/envs` ; do
#         set -x PATH "$HOME/.anyenv/envs/$env_name/shims:$PATH"
#     done
#     eval "$(anyenv init - zsh)"
# fi

# Go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# Rust
set -x PATH $HOME/.cargo/bin $PATH 

# Haskell
set -x PATH $HOME/.local/bin $PATH

# Javaのデフォルトの文字コードを設定する
set -x JAFA_TOOL_OPTIONS -Dfile.encoding=UTF-8

switch (uname)
case Darwin
    # Android系
    set -x ANDROID_HOME $HOME/Library/Android/sdk
    set -x PATH $ANDROID_HOME/tools $PATH
    set -x PATH $ANDROID_HOME/platform-tools $PATH

    # El Capitan以上ではやっておくとようさそう感
    # https://github.com/servo/servo/ より
    set -x OPENSSL_INCLUDE_DIR "(brew --prefix openssl)/include"
    set -x OPENSSL_LIB_DIR "(brew --prefix openssl)/lib"
end


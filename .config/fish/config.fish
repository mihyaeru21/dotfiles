export LANG=ja_JP.UTF-8
export JLESSCHARSET=japanese
export LC_CTYPE="ja_JP.UTF-8"
export LC_NUMERIC="ja_JP.UTF-8"
export LC_TIME="ja_JP.UTF-8"
export LC_COLLATE="ja_JP.UTF-8"
export LC_MONETARY="ja_JP.UTF-8"
export LC_MESSAGES="ja_JP.UTF-8"
export LC_PAPER="ja_JP.UTF-8"
export LC_NAME="ja_JP.UTF-8"
export LC_ADDRESS="ja_JP.UTF-8"
export LC_TELEPHONE="ja_JP.UTF-8"
export LC_MEASUREMENT="ja_JP.UTF-8"
export LC_IDENTIFICATION="ja_JP.UTF-8"

# fishermanでインストールするディレクトリを変更
set -U fish_path ~/dotfiles/fisher

# # 環境ごとの設定ファイルを読み込む
# [ -f ~/.zprofile.local ] && source ~/.zprofile.local

# xxenv
status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)

# FIXME: これいらんな移行完了後に消すぞ
set -x PATH /usr/local/bin /usr/local/sbin $PATH

# Rust
set -x PATH $HOME/.cargo/bin $PATH

# Go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# Haskell
set -x PATH $HOME/.local/bin $PATH

# Javaのデフォルトの文字コードを設定する
set -x JAFA_TOOL_OPTIONS -Dfile.encoding=UTF-8

# いろいろ入れておくところ
set -x PATH $PATH $HOME/dotfiles/.bin

# OSごとの設定
switch (uname)
case Darwin
    # Android系
    set -x ANDROID_HOME $HOME/Library/Android/sdk
    set -x PATH $PATH $ANDROID_HOME/tools
    set -x PATH $PATH $ANDROID_HOME/platform-tools

    # El Capitan以上ではやっておくとようさそう感
    # https://github.com/servo/servo/ より
    set -x OPENSSL_INCLUDE_DIR "(brew --prefix openssl)/include"
    set -x OPENSSL_LIB_DIR "(brew --prefix openssl)/lib"

    alias ls="ls -xFG"
    alias owata="notify-me ｵﾜﾀ '＼(^o^)／'"
case Linux
    alias ls="ls -xF --color=auto"
end


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

# ログイン時に出てくるメッセージを表示させない
set fish_greeting ""

# fzfでマウスを無効に
set -x FZF_DEFAULT_OPTS --no-mouse

if status --is-interactive
    # for plenv
    set -x PATH $PATH $HOME/.plenv/bin

    # xxenv
    source (rbenv init -|psub)
    source (nodenv init -|psub)
    source (plenv init -|psub)

    # Rust
    set -x PATH $PATH $HOME/.cargo/bin

    # Go
    set -x GOPATH $HOME/go
    set -x PATH $PATH $GOPATH/bin

    # Haskell
    set -x PATH $PATH $HOME/.local/bin

    # Javaのデフォルトの文字コードを設定する
    set -x JAFA_TOOL_OPTIONS -Dfile.encoding=UTF-8

    # いろいろ入れておくところ
    set -x PATH $PATH $HOME/dotfiles/.bin
end

# OSごとの設定
switch (uname)
case Darwin
    if status --is-interactive
        # Android系
        set -x ANDROID_HOME $HOME/Library/Android/sdk
        set -x PATH $PATH $ANDROID_HOME/tools
        set -x PATH $PATH $ANDROID_HOME/platform-tools

        # El Capitan以上ではやっておくとようさそう感
        # https://github.com/servo/servo/ より
        set -x OPENSSL_INCLUDE_DIR "(brew --prefix openssl)/include"
        set -x OPENSSL_LIB_DIR "(brew --prefix openssl)/lib"
    end

    alias ls="ls -xFG"
    alias owata="notify-me ｵﾜﾀ '＼(^o^)／'"
case Linux
    alias ls="ls -xF --color=auto"
end

# 環境ごとの設定
test -f $HOME/dotfiles/local/fish.fish; and source $HOME/dotfiles/local/fish.fish


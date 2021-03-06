set -x LANG en_US.UTF-8

# ログイン時に出てくるメッセージを表示させない
set fish_greeting ""

set -x EDITOR nvim

# fzfでマウスを無効に
set -x FZF_DEFAULT_OPTS --no-mouse

if status --is-interactive
    # anyenv
    set -x PATH $PATH $HOME/.anyenv/bin
    anyenv init - fish | source

    # direnv
    direnv hook fish | source

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
    set -x PATH $PATH $HOME/bin
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
    alias pbcopy='xsel --clipboard --input'
end

# 環境ごとの設定
test -f $HOME/dotfiles/local/fish.fish; and source $HOME/dotfiles/local/fish.fish


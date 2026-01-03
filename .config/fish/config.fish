set -x LANG en_US.UTF-8

# ログイン時に出てくるメッセージを表示させない
set fish_greeting ""

set -x EDITOR nvim

# fzfでマウスを無効に
set -x FZF_DEFAULT_OPTS --no-mouse

if status --is-interactive

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
    source $HOME/.config/fish/mac.fish
case Linux
    source $HOME/.config/fish/linux.fish
end

# 環境ごとの設定
test -f $HOME/dotfiles/local/fish.fish; and source $HOME/dotfiles/local/fish.fish

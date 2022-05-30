export LANG=en_US.UTF-8 # ja_JP だと地味に日本語になって逆にわかりづらい
export LESSCHARSET=UTF-8
export EDITOR=nvim

# direnv
. $HOME/.config/asdf-direnv/zshrc

# Rust
. $HOME/.cargo/env

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Java のデフォルトの文字コードを設定する
export JAFA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

# なんか入れておく場所
export PATH=$PATH:$HOME/.bin

# fzf でマウスを無効に
export FZF_DEFAULT_OPTS=--no-mouse

# ripgrep のデフォルト引数を設定するファイル
export RIPGREP_CONFIG_PATH=$HOME/dotfiles/.ripgreprc

autoload -Uz compinit && compinit # 補完
autoload -Uz zmv                  # zmvを使えるように
typeset -U path PATH              # pathの重複をみとめない
setopt auto_pushd                 # ディレクトリ履歴
setopt correct                    # 類似コマンド表示
setopt list_packed                # 補完候補を詰めて表示
setopt nolistbeep                 # ビープ音を鳴らさない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完する時に大文字小文字を区別しない

# 履歴関連
HISTFILE=$HOME/dotfiles/zsh/history
HISTSIZE=300000
SAVEHIST=300000
setopt hist_ignore_dups  # 重複を無視
setopt share_history     # 履歴共有

# キーバインドを vi モードにする
bindkey -v

# vi(viins) モードで emacs 風な操作をできるようにする
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
bindkey -M viins '^D'  delete-char-or-list
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^F'  forward-char
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank

# ssh-agent for tmux
# https://qiita.com/sonots/items/2d7950a68da0a02ba7e4
agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
        /tmp/*/agent.[0-9]* ) ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent && echo 'agent ok'
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    echo "no ssh-agent"
fi


export LANG=en_US.UTF-8 # ja_JP だと地味に日本語になって逆にわかりづらい
export LESSCHARSET=UTF-8
export EDITOR=nvim

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# direnv
. "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

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

#入力途中の履歴補完
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end


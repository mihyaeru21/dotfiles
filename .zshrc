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

# 補完
autoload -U compinit
compinit

# zmvを使えるように
autoload -Uz zmv

# pathの重複をみとめない
typeset -U path PATH

# 履歴関連
HISTFILE=~/.zsh_history
HISTSIZE=300000
SAVEHIST=300000
setopt hist_ignore_dups  # 重複を無視
setopt share_history     # 履歴共有

# 設定もろもろ
setopt auto_pushd    # ディレクトリ履歴
setopt correct       # 類似コマンド表示
setopt list_packed   # 補完候補を詰めて表示
setopt nolistbeep    # ビープ音を鳴らさない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完する時に大文字小文字を区別しない

#入力途中の履歴補完
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

#履歴のインクリメンタル検索でワイルドカード利用可能
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# カラー表示
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# プロンプト
setopt prompt_subst
source $HOME/dotfiles/.zsh/prompt-git-current-branch.zsh
source $HOME/dotfiles/.zsh/anyenv-program-version.zsh
PROMPT='%F{cyan}[%n@%m:%~]%f`anyenv_versions_local_only``get_vcs_info_msg`
%F{yellow}[%D %*]%f%(?!%F{green}!%F{red})%(?!(っ \`-'\'' c%)!(っ '\''-\` c%))%f '

source $HOME/dotfiles/.zsh/antigen.zsh
source $HOME/dotfiles/.zsh/vcs.zsh
source $HOME/dotfiles/.zsh/func.zsh
source $HOME/dotfiles/.zsh/alias.zsh

# Mac用の設定
if uname | grep Darwin > /dev/null ; then
    source $HOME/dotfiles/.zsh/zshrc.mac.zsh
fi

# Linux用の設定
if uname | grep Linux > /dev/null ; then
    source $HOME/dotfiles/.zsh/zshrc.linux.zsh
fi

# 個別の環境用の設定
# いろいろ上書きできるように最後に読む
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


export LANG=ja_JP.UTF-8

# 補完
autoload -U compinit
compinit

# zmvを使えるように
autoload -Uz zmv

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

# カラー表示
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# プロンプト
setopt prompt_subst
source $HOME/.zsh/prompt-git-current-branch
PROMPT='%F{green}%n $%f '
RPROMPT='`prompt-git-current-branch`%F{yellow}[%m:%~]%f'

# ターミナルのタイトル
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# alias
alias e="exit"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"
alias u="cd ../"
alias uu="cd ../../"
alias uuu="cd ../../../"
alias tmux='tmuxx'

# path
export PATH=$PATH:~/bin
export PATH=$PATH:~/.bin

# 環境ごとの設定ファイルを読み込む
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

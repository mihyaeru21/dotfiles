# fisherでインストールするディレクトリを変更
set -U fish_path ~/dotfiles/fisher



#### 以下 zshrc から持ってきたやつら

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


# FIXME: プロンプトは後でいじる
# setopt prompt_subst
# source $HOME/dotfiles/.zsh/prompt-git-current-branch.zsh
# source $HOME/dotfiles/.zsh/anyenv-program-version.zsh
# PROMPT='%F{cyan}[%n@%m:%~]%f`anyenv_versions_local_only``get_vcs_info_msg`
# %F{yellow}[%D %*]%f%(?!%F{green}!%F{red})%(?!(っ \`-'\'' c%)!(っ '\''-\` c%))%f '

alias e="exit"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"
alias u="cd ../"
alias uu="cd ../../"
alias uuu="cd ../../../"
alias uuuu="cd ../../../../"
alias uuuuu="cd ../../../../../"
alias uuuuuu="cd ../../../../../../"
alias b="cd -"
alias be="bundle exec"

# slackのやつ
alias st-p1="skintone.pl +1 | pbcopy"
alias st-pray="skintone.pl pray | pbcopy"
alias st-muscle="skintone.pl muscle | pbcopy"
alias st-point_up="skintone.pl point_up | pbcopy"
alias st-point_up_2="skintone.pl point_up_2 | pbcopy"

# 自分のグローバルIPを確認する
alias global-ip='curl globalip.me'
alias gip='global-ip'

switch (uname)
case Darwin
    alias ls="ls -xFG"
    alias owata="notify-me ｵﾜﾀ '＼(^o^)／'"
case Linux
    alias ls="ls -xF --color=auto"
end



#### 以下 zprofile から持ってきたやつら

# # 環境ごとの設定ファイルを読み込む
# [ -f ~/.zprofile.local ] && source ~/.zprofile.local

# FIXME: これいらんな移行完了後に消すぞ
set -x PATH /usr/local/bin /usr/local/sbin $PATH

# いろいろ入れておくところ
set -x PATH $PATH $HOME/dotfiles/.bin

# xxenv
status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)

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
    set -x PATH $PATH $ANDROID_HOME/tools
    set -x PATH $PATH $ANDROID_HOME/platform-tools

    # El Capitan以上ではやっておくとようさそう感
    # https://github.com/servo/servo/ より
    set -x OPENSSL_INCLUDE_DIR "(brew --prefix openssl)/include"
    set -x OPENSSL_LIB_DIR "(brew --prefix openssl)/lib"
end


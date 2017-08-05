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

# promptに表示するgit部分のスタイル
set blue (set_color blue)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_char_upstream_prefix ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_char_stateseparator '|'
set __fish_git_prompt_char_dirtystate 'm'
set __fish_git_prompt_char_stagedstate 'a'
set __fish_git_prompt_char_untrackedfiles 'u'
set __fish_git_prompt_char_invalidstate 'x'
set __fish_git_prompt_char_cleanstate '✔'
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_untrackedfiles yellow
set __fish_git_prompt_color_cleanstate green




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


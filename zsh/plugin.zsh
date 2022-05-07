export ZPLUG_HOME=$HOME/dotfiles/zsh/zplug

. $ZPLUG_HOME/init.zsh

# 補完強化
zplug 'zsh-users/zsh-completions'

# プロンプトの入力に色をつける
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# プロンプトの入力中に候補を出す
zplug 'zsh-users/zsh-autosuggestions', defer:2

# ^r に history fzf を割り当てる
zplug 'joshskidmore/zsh-fzf-history-search'

# ^g に ghq fzf を割り当てる
zplug 'subaru-shoji/zsh-fzf-ghq'

# テーマたち
zplug 'dracula/zsh', as:theme
# zplug 'mafredri/zsh-async', use:'async.zsh'
# zplug 'sindresorhus/pure', use:'pure.zsh', as:theme

# 未インストールのプラグインがあるかチェックする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load # --verbose はデバッグ時につける


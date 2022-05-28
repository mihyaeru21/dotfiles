# カラー表示
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# direnv が有効になっている場所では表示する
# 少し重くなるから今は使ってない
_prompt_direnv() {
    if direnv status | grep 'Found.*allowed.*true' > /dev/null ; then
        echo -n '%F{yellow}[direnv]%f'
    fi
}

# 現在の vi モードをプロンプトに表示する
_prompt_vi_mode() {
    case $KEYMAP in
        vicmd)
            echo -n '%F{yellow}[N]%f'
            ;;
        main|viins)
            echo -n '[I]'
            ;;
    esac
}

# ssh 経由の場合にその旨を表示する
_prompt_ssh() {
    if [ -n "$SSH_CONNECTION" ]; then
        echo -n '%F{magenta}(ssh)%f'
    fi
}

# init と keymap が変わったときにプロンプトをリセットする
zle-line-init() { zle reset-prompt }
zle-keymap-select() { zle reset-prompt }
zle -N zle-line-init
zle -N zle-keymap-select

# プロンプト
setopt prompt_subst
PROMPT='%F{cyan}[%n@%m$(_prompt_ssh):%~]%f$(gitprompt)
$(_prompt_vi_mode)%(?!%F{green}!%F{red})[%?]%(?!(っ \`-'\'' c%)!(っ '\''-\` c%))%f '
RPROMPT='%F{yellow}[%D %*]%f'

# gitprompt のカスタマイズ https://github.com/woefe/git-prompt.zsh#appearance
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND="|-"
ZSH_THEME_GIT_PROMPT_AHEAD="|+"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}m"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}a"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}u"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}ok"


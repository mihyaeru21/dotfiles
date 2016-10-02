############################################################
# vcs_info
############################################################

autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz colors

zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:*' formats '(%s)-[%b]' '%m' '<!%a>'
zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '<!%a>'

zstyle ':vcs_info:git+set-message:*' hooks git-hook-begin git-untracked git-push-status git-nomerge-branch git-stash-count

function +vi-git-hook-begin() {
    if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
        return 1
    fi
    return 0
}

function +vi-git-untracked() {
    # zstyle formats, actionformats の2番目のメッセージのみ対象にする
    if [[ "$1" != "1" ]]; then
        return 0
    fi

    if command git status --porcelain 2> /dev/null \
        | awk '{print $1}' \
        | command grep -F '??' > /dev/null 2>&1 ; then

        # unstaged (%u) に追加
        hook_com[unstaged]+='?'
    fi
}

function +vi-git-push-status() {
    # zstyle formats, actionformats の2番目のメッセージのみ対象にする
    if [[ "$1" != "1" ]]; then
        return 0
    fi

    if [[ "${hook_com[branch]}" != "master" ]]; then
        # master ブランチでない場合は何もしない
        return 0
    fi

    # push していないコミット数を取得する
    local ahead
    ahead=$(command git rev-list origin/master..master 2>/dev/null \
        | wc -l \
        | tr -d ' ')

    if [[ "$ahead" -gt 0 ]]; then
        # misc (%m) に追加
        hook_com[misc]+="(p${ahead})"
    fi
}

function +vi-git-nomerge-branch() {
    # zstyle formats, actionformats の2番目のメッセージのみ対象にする
    if [[ "$1" != "1" ]]; then
        return 0
    fi

    if [[ "${hook_com[branch]}" == "master" ]]; then
        # master ブランチの場合は何もしない
        return 0
    fi

    local nomerged
    nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

    if [[ "$nomerged" -gt 0 ]] ; then
        # misc (%m) に追加
        hook_com[misc]+="(m${nomerged})"
    fi
}

function +vi-git-stash-count() {
    # zstyle formats, actionformats の2番目のメッセージのみ対象にする
    if [[ "$1" != "1" ]]; then
        return 0
    fi

    local stash
    stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
    if [[ "${stash}" -gt 0 ]]; then
        # misc (%m) に追加
        hook_com[misc]+=":S${stash}"
    fi
}

function get_vcs_info_msg() {
    local -a messages

    LANG=ja_JP.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        echo ""
    else
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

        # 間にスペースを入れて連結する
        echo "${(j: :)messages}"
    fi
}

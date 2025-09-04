# mac だと C.UTF-8 がない
export LANG=ja_JP.UTF-8

alias ls="ls -xFG"
alias owata="notify-me ｵﾜﾀ '＼(^o^)／'"

notify-me()
{
    title=$1
    content=$2
    osascript -e "display notification \"$content\" with title \"$title\""
}


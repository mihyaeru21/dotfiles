# Mac用の設定

alias ls="ls -xFG"
alias owata="notify-me ｵﾜﾀ '＼(^o^)／'"

# Go
export GOROOT=/usr/local/opt/go/libexec

# ローカル通知を簡単に送る
function notify-me() {
    if [ $1 ]; then; title=$1; else; title=ping; fi
    content=$2
    osascript -e "display notification \"$content\" with title \"$title\""
}

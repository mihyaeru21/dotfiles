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

ut2dt() {
  if [[ -z "$1" ]]; then
    echo "Usage: ut2dt <unix_timestamp>" >&2
    return 1
  fi
  date -r "$1" '+%Y-%m-%d %H:%M:%S'
}

dt2ut() {
  if [[ -z "$1" ]]; then
    echo "Usage: dt2ut <datetime>" >&2
    echo "Example: dt2ut '2025-01-02 12:34:56'" >&2
    return 1
  fi
  date -j -f '%Y-%m-%d %H:%M:%S' "$1" '+%s'
}

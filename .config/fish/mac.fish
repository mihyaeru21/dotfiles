# mac だと C.UTF-8 がない
export LANG=ja_JP.UTF-8

alias ls="ls -xFG"
alias owata="notify-me ｵﾜﾀ '＼(^o^)／'"

function notify-me
  set title $argv[1]
  set content $argv[2]
  osascript -e "display notification \"$content\" with title \"$title\""
end

function ut2dt
  if test -z "$argv[1]"
    echo "Usage: ut2dt <unix_timestamp>" >&2
    return 1
  end
  date -r "$argv[1]" '+%Y-%m-%d %H:%M:%S'
end

function dt2ut
  if test -z "$argv[1]"
    echo "Usage: dt2ut <datetime>" >&2
    echo "Example: dt2ut '2025-01-02 12:34:56'" >&2
    return 1
  end
  date -j -f '%Y-%m-%d %H:%M:%S' "$argv[1]" '+%s'
end

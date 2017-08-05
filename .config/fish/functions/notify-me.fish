function notify-me
    set title $argv[1]
    set content $argv[2]
    osascript -e "display notification \"$content\" with title \"$title\""
end


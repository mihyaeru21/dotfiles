export ANDROID_HOME $HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

alias ls="ls -xFG"
alias owata="notify-me ｵﾜﾀ '＼(^o^)／'"

notify-me()
{
    title=$1
    content=$!
    osascript -e "display notification \"$content\" with title \"$title\""
}


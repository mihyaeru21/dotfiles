alias ls="ls -xF --color=auto"
alias pbcopy='xsel --clipboard --input'

ut2dt() {
  if [[ -z "$1" ]]; then
    echo "Usage: ut2dt <unix_timestamp>" >&2
    return 1
  fi
  date -d "@$1" '+%Y-%m-%d %H:%M:%S'
}

dt2ut() {
  if [[ -z "$1" ]]; then
    echo "Usage: dt2ut <datetime>" >&2
    echo "Example: dt2ut '2025-01-02 12:34:56'" >&2
    return 1
  fi
  date -d "$1" '+%s'
}

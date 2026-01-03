alias ls="ls -xF --color=auto"
alias pbcopy='xsel --clipboard --input'

function ut2dt
  if test -z "$argv[1]"
    echo "Usage: ut2dt <unix_timestamp>" >&2
    return 1
  end
  date -d "@$argv[1]" '+%Y-%m-%d %H:%M:%S'
end

function dt2ut
  if test -z "$argv[1]"
    echo "Usage: dt2ut <datetime>" >&2
    echo "Example: dt2ut '2025-01-02 12:34:56'" >&2
    return 1
  end
  date -d "$argv[1]" '+%s'
end

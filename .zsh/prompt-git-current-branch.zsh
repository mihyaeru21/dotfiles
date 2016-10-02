function prompt-git-current-branch {
    local name st color

    name=`git symbolic-ref HEAD 2> /dev/null`
    if [[ -z $name ]]
    then
        return
    fi
    name=`echo $name | sed s#refs/heads/##`

    st=`git status`
    if [[ -n `echo $st | grep "^nothing to"` ]]
    then
        color="green"
    else
        color="red"
    fi

    echo "%F{$color}[$name]%f"
}


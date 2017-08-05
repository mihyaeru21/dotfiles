function fish_prompt
    set prev_status $status
    set user (whoami)
    set host (prompt_hostname)
    set dir (prompt_pwd)
    set dt (date +'%Y-%m-%d %T')
    set git (__fish_git_prompt)
    set ruby (__ruby_version)
    set node (__node_version)

    set_color cyan
    echo -n "[$user@$host:$dir]"

    set_color magenta
    echo -n "[Ruby:$ruby][Node:$node]"

    set_color normal
    echo $git

    set_color yellow
    echo -n "[$dt]"

    if test $prev_status -eq 0
        set_color green
        echo -n "(っ `-' c) "
    else
        set_color red
        echo -n "(っ '-` c) "
    end
    set_color normal
end

function __ruby_version
    rbenv version | cut -f1 -d' '
end

function __node_version
    nodenv version | cut -f1 -d' '
end


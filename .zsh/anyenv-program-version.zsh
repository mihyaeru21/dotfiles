function find_in_local_env {
    local lang=$1
    local dir=$PWD

    while [[ -n $dir && $dir != "/" && $dir != "." ]]; do
        if [[ -f "$dir/.${lang}-version" ]]; then
            version=`head -n 1 "$dir/.${lang}-version"`
            echo -n "%F{yellow}[$2:$version]%f"
            return
        fi
        dir=$dir:h
    done
}

function find_in_anyenv {
    local env_home=$1
    if [[ -f "$env_home/version" ]]; then
        version=`head -n 1 "$env_home/version"`
        echo -n "%F{green}[$2:$version]%f"
    fi
}

function anyenv_perl_version {
    localenv=`find_in_local_env "perl" "pl"`
    if [[ -n $localenv ]]; then
        echo $localenv
        return
    fi

    find_in_anyenv "$HOME/.anyenv/envs/plenv" "pl"
}

function anyenv_python_version {
    localenv=`find_in_local_env "python" "py"`
    if [[ -n $localenv ]]; then
        echo $localenv
        return
    fi

    find_in_anyenv "$HOME/.anyenv/envs/pyenv" "py"
}

function anyenv_ruby_version {
    localenv=`find_in_local_env "ruby" "rb"`
    if [[ -n $localenv ]]; then
        echo $localenv
        return
    fi

    find_in_anyenv "$HOME/.anyenv/envs/rbenv" "rb"
}

function anyenv_versions_local_only {
    langs=("python" "perl" "ruby" "node")
    for lang in "${langs[@]}" ; do
        find_in_local_env $lang $lang
    done
}


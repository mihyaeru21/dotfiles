#!/usr/bin/env zsh

set -ex

# zsh が動く環境向けの設定をやっていく

# .hoge の sym link
for dotfile_path in `find . -maxdepth 1 -name '.*' | sed 's/\.\///' | grep -v '^\.$' | grep -vE '^\.(git|gitignore|config)$' | sort`; do
    target=$HOME/$dotfile_path
    test -L $target || ln -s $HOME/dotfiles/$dotfile_path $target
done

# .config/hoge の sym link
mkdir -p $HOME/.config
for config_path in `find .config -maxdepth 1 | sed 's/\.\///' | grep -v '^\.config$' | sort`; do
    target=$HOME/$config_path
    test -L $target || ln -s $HOME/dotfiles/$config_path $target
done

# local files
for localfile_path in `find local -name '*.sample'`; do
    target=`echo $localfile_path | sed 's/\.sample//'`
    test -e $target || cp $localfile_path $target
done

# mise
if [ ! -e ~/.local/bin/mise ]; then
    curl https://mise.run | sh
fi
$HOME/.local/bin/mise self-update -y
$HOME/.local/bin/mise install -y

# rust
set +e
command -v rustc > /dev/null 2>&1
rust_exists=$?
set -e
if [ $rust_exists -ne 0 ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    rm $HOME/.zshenv # zshrc に記述済みのやつが追加されてしまうので削除
fi

# rust tools
source $HOME/.cargo/env
cargo install ripgrep fd-find cross cargo-update bat eza hexyl procs git-delta du-dust

# go tools
go install github.com/tomnomnom/gron@latest

# python tools
pip install --upgrade tmuxp

# vim
plug_path=$HOME/.config/vim/autoload/plug.vim
if [ ! -e $plug_path ]; then
    curl -fLo $plug_path --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +'PlugInstall --sync' +qa
fi

# zsh
zplug_path=$HOME/dotfiles/zsh/zplug
if [ ! -e $zplug_path ]; then
    git clone https://github.com/zplug/zplug $zplug_path
    chsh -s /usr/bin/zsh
fi

# tmux-mem-cpu-load
set +e
command -v tmux-mem-cpu-load > /dev/null 2>&1
tmcl_exists=$?
set -e
if [ $tmcl_exists -ne 0 ]; then
    git clone --depth 1 https://github.com/thewtex/tmux-mem-cpu-load.git /tmp/tmux-mem-cpu-load
    pushd /tmp/tmux-mem-cpu-load
    cmake .
    make
    sudo make install
    popd
fi

echo 'Done.'

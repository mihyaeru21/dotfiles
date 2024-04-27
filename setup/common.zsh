#!/usr/bin/zsh -ex

# zsh が動く環境向けの設定をやっていく

# .hoge の sym link
for dotfile_path in `find . -maxdepth 1 -name '.*' | sed 's/\.\///' | grep -v '^\.$' | grep -vE '^\.(git|config)$' | sort`; do
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

# asdf
which asdf > /dev/null 2>&1
if [ $? -ne 0 ]; then
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.14.0
    . $HOME/.asdf/asdf.sh
fi

# asdf で使っているやつを全部インストールする
for plugin in `cat .tool-versions | cut -d ' ' -f 1`; do
    asdf plugin add $plugin
done
asdf update --all
asdf install perl
asdf install

# direnv は別途設定が必要
asdf direnv setup --shell zsh --version $(cat .tool-versions | grep direnv | cut -d ' ' -f 2)
sed -i '/asdf-direnv\/zshrc/d' $HOME/dotfiles/.zshrc # general.zsh に記述済みのやつが追加されてしまうので削除

# rust
which rustc > /dev/null 2>&1
if [ $? -ne 0 ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    rm $HOME/.zshenv # zshrc に記述済みのやつが追加されてしまうので削除
fi

# rust tools
source $HOME/.cargo/env
cargo install ripgrep fd-find cross cargo-update bat exa hexyl procs git-delta du-dust

# go tools
go install github.com/tomnomnom/gron@latest

# python tools
pip3 install tmuxp

# vim
plug_path=$HOME/.vim/autoload/plug.vim
if [ ! -e $plug_path ]; then
    curl -fLo $plug_path --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +'PlugInstall --sync' +qa
fi

# neovim
packer_path=$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
if [ ! -e $packer_path ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim $packer_path
fi

# zsh
zplug_path=$HOME/dotfiles/zsh/zplug
if [ ! -e $zplug_path ]; then
    git clone https://github.com/zplug/zplug $zplug_path
    chsh -s /usr/bin/zsh
fi

# tmux-mem-cpu-load
which tmux-mem-cpu-load > /dev/null 2>&1
if [ $? -ne 0 ]; then
    git clone --depth 1 https://github.com/thewtex/tmux-mem-cpu-load.git /tmp/tmux-mem-cpu-load
    pushd /tmp/tmux-mem-cpu-load
    cmake .
    make
    sudo make install
    popd
fi

echo 'Done.'


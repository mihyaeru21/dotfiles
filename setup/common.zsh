#!/usr/bin/zsh -ex

# zsh が動く環境向けの設定をやっていく

# asdf
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.10.0

# .hoge の sym link
for dotfile_path in `find . -maxdepth 1 -name '.*' | sed 's/\.\///' | grep -v '^\.$' | grep -vE '^\.(git|config)$' | sort`; do
    ln -s $HOME/dotfiles/$dotfile_path $HOME/$dotfile_path
done

# .config/hoge の sym link
mkdir -p $HOME/.config
for config_path in `find .config -maxdepth 1 | sed 's/\.\///' | grep -v '^\.config$' | sort`; do
    ln -s $HOME/dotfiles/$config_path $HOME/$config_path
done

# local files
for localfile_path in `find local -name '*.sample'`; do
    cp $localfile_path `echo $localfile_path | sed 's/\.sample//'`
done

# asdf で使っているやつを全部インストールする
. $HOME/.asdf/asdf.sh
for plugin in `cat .tool-versions | cut -d ' ' -f 1`; do
    asdf plugin add $plugin
done
asdf install

# direnv は別途設定が必要
asdf direnv setup --shell zsh --version $(cat .tool-versions | grep direnv | cut -d ' ' -f 2)
sed -i '/asdf-direnv\/zshrc/d' $HOME/dotfiles/.zshrc # general.zsh に記述済みのやつが追加されてしまうので削除

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rm $HOME/.zshenv # zshrc に記述済みのやつが追加されてしまうので削除

# rust tools
source $HOME/.cargo/env
cargo install ripgrep fd-find cross cargo-update bat exa hexyl procs gobang

# node tools
npm install --global diff-so-fancy

# vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

# zsh
git clone https://github.com/zplug/zplug $HOME/dotfiles/zsh/zplug
chsh -s /usr/bin/zsh


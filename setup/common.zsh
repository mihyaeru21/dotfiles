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

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# rust tools
source $HOME/.cargo/env
cargo install ripgrep

# node tools
npm install --global diff-so-fancy

# vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# neovim
git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

# zsh
git clone https://github.com/zplug/zplug $HOME/dotfiles/zsh/zplug


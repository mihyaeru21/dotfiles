# zsh が動く環境向けの設定をやっていく

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0

# リンク
dot_files=()
for dot_file in $dot_files; do
    echo $dot_file
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
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa


dotfiles
========

先に鍵を用意しておく。
WSL 環境ならホストからリンクを貼る。

```sh
curl -sSf https://raw.githubusercontent.com/mihyaeru21/dotfiles/master/setup/wsl-conf.bash | bash -ex
```

ここで WSL が終了しているので再度立ち上げる。

```sh
curl -sSf https://raw.githubusercontent.com/mihyaeru21/dotfiles/master/setup/wsl-prepare.bash | bash -ex
```

```sh
git clone git@github.com:mihyaeru21/dotfiles.git $HOME/dotfiles && cd $HOME/dotfiles
./setup/ubuntu.bash
```


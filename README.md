dotfiles
========

## 下準備
### Ubuntu(WSL)
ホストから .ssh のリンクを貼るために WSL の設定を追加して再起動する。

```sh
cat <<EOS | sudo tee -a /etc/wsl.conf
[automount]
options = "metadata"
EOS
wsl.exe --shutdown
```

ここで WSL が終了しているので再度立ち上げる。

```sh
ln -s "/mnt/c/Users/$(whoami.exe | cut -d '\' -f 2 | sed 's/\s//g')/.ssh" $HOME/.ssh && chmod 700 $HOME/.ssh && chmod 600 $HOME/.ssh/*
```

### その他
鍵を用意する。


## 実行

```sh
git clone git@github.com:mihyaeru21/dotfiles.git $HOME/dotfiles && cd $HOME/dotfiles && ./setup/ubuntu.bash
```


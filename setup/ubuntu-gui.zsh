#!/usr/bin/zsh -ex

# Ubuntu GUI 環境向け

# xremap
################

curl -L https://github.com/xremap/xremap/releases/latest/download/xremap-linux-x86_64-x11.zip > xremap.zip
unzip xremap.zip
sudo mv xremap /usr/local/bin
rm xremap.zip

sudo gpasswd -a $USER input
echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/input.rules

systemctl --user enable xremap
systemctl --user start xremap

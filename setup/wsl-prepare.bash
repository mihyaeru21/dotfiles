# sudo でパスワードを不要にする
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo

# .ssh の sym link を作る
user_name=`whoami.exe | cut -d '\' -f 2 | sed 's/\s//g'`
ln -s "/mnt/c/Users/$user_name/.ssh" $HOME/.ssh
chmod 700 $HOME/.ssh
chmod 600 $HOME/.ssh/*


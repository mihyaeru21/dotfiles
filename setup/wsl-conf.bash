echo <<EOS | sudo tee -a /etc/wsl.conf
[automount]
options = "metadata"
EOS

wsl.exe --shutdown


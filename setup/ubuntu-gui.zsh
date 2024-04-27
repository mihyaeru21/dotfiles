#!/usr/bin/zsh -ex

# Ubuntu GUI 環境向け

# xremap
which xremap > /dev/null 2>&1
if [ $? -ne 0 ]; then
    curl -L https://github.com/xremap/xremap/releases/latest/download/xremap-linux-x86_64-x11.zip > xremap.zip
    unzip xremap.zip
    sudo mv xremap /usr/local/bin
    rm xremap.zip

    # ここを実行した後に再起動する
    sudo gpasswd -a $USER input
    echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/input.rules

    systemctl --user enable xremap
    systemctl --user start xremap
fi

flatpak install \
    com.discordapp.Discord \
    com.github.PintaProject.Pinta \
    com.obsproject.Studio \
    com.slack.Slack \
    com.ultimaker.cura \
    dev.deedles.Trayscale \
    fr.natron.Natron \
    org.blender.Blender \
    org.godotengine.Godot \
    org.godotengine.Godot3 \
    org.inkscape.Inkscape \
    org.kicad.KiCad \
    org.videolan.VLC

flatpak install --user https://flathub.org/beta-repo/appstream/org.gimp.GIMP.flatpakref

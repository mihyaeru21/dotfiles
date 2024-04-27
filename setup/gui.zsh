#!/usr/bin/zsh -ex

# GUI 環境向け

systemctl --user enable ssh-agent
systemctl --user start ssh-agent

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

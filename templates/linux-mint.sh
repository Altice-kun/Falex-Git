#!/bin/bash

# Linux Mint Layout Template for Falex OS

gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.desktop.interface show-desktop-icons true
gsettings set org.gnome.shell favorite-apps "['nemo.desktop', 'firefox.desktop', 'org.gnome.Terminal.desktop']"

echo "Linux Mint layout applied."
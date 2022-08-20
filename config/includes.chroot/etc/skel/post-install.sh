#!/bin/bash

# change wallpaper
xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/image-path --set /usr/share/backgrounds/custom/blackscreen.png

# adjust keybinds (add Super + E for file manager)
if ! which xmlstarlet &> /dev/null; then
  sudo apt install -y xmlstarlet
fi
keyboardShortcutsConfig="~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"
xPath='/channel/property[@name="commands"]/property[@name="custom"]/property[not(@name)]'
xmlstarlet ed --inplace --insert ${xPath} --type attr --name "name" --value "&lt;Super&gt;e" ${keyboardShortcutsConfig}
xmlstarlet ed --inplace --insert ${xPath} --type attr --name "type" --value "string" ${keyboardShortcutsConfig}
xmlstarlet ed --inplace --insert ${xPath} --type attr --name "value" --value "exo-open --launch FileManager" ${keyboardShortcutsConfig}

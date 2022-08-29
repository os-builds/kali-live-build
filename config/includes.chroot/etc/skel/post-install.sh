#!/bin/bash

# change wallpaper
#xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/image-path --set /usr/share/backgrounds/custom/blackscreen.png

# change wallpaper on live system running inside a virtual machine
#xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual1/workspace0/last-image --set /usr/share/backgrounds/custom/blackscreen.png

# adjust keybinds (add Super + E for file manager)
# TODO not working
xmlstarlet ed --inplace --subnode \
  '/channel/property[@name="commands"]/property[@name="custom"]' \
  --type elem --name "property" \
  ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

xmlstarlet ed --inplace --insert \
  '/channel/property[@name="commands"]/property[@name="custom"]/property[not(@name)]' \
  --type attr --name "name" --value "<Super>e" \
  ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

xmlstarlet ed --inplace --insert \
  '/channel/property[@name="commands"]/property[@name="custom"]/property[@name="<Super>e"]' \
  --type attr --name "type" --value "string" \
  ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

xmlstarlet ed --inplace --insert \
  '/channel/property[@name="commands"]/property[@name="custom"]/property[@name="<Super>e"]' \
  --type attr --name "value" --value "exo-open --launch FileManager" \
  ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

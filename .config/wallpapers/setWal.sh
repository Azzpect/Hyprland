#!/bin/bash

file_path=$(zenity --file-selection --title="Select a wallpaper" --filename="~/.config/wallpapers/")
conf=~/.config/wallpapers/wallpaper.conf

swaybg -i "$file_path" &
$SWAY_PID=$!
sleep 1
kill $SWAY_PID

echo "hello"
echo "generating color schemas"
wal -i "$file_path"

# Clear previous wallpaper settings
sed -i '/wallpaper=/d' "$conf"

echo "wallpaper=$file_path" >> "$conf"
echo "wallpaper=$file_path"

echo "creating rofi color schema file if not existed"
if [ ! -e "~/.config/rofi/colors.rasi" ]; then
  touch ~/.config/rofi/colors.rasi
fi

echo "copying color schemas"
cp ~/.cache/wal/sequences ~/.config/colors/
cp ~/.cache/wal/colors-rofi-light.rasi ~/.config/colors/
cp ~/.cache/wal/colors-waybar.css ~/.config/colors/

echo "generating rofi color template"
printf "@import \"~/.config/colors/colors-rofi-light\"\nelement-text {\nbackground-color: inherit;\ntext-color: inherit;\n}" > ~/.config/rofi/colors.rasi

~/.config/hypr/restartWaybar.sh

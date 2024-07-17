#!/bin/bash

file_path=$(zenity --file-selection --title="Select a wallpaper" --filename="~/.config/wallpapers/")
hypr=~/.config/hypr/hyprpaper.conf

echo "unloading wallpapers"
hyprctl hyprpaper unload all
echo "generating color schemas"
wal -i "$file_path"
# Clear previous wallpaper settings
sed -i '/preload =/d' "$hypr"
sed -i '/wallpaper =/d' "$hypr"

# Update hyprpaper.conf
echo "preload = $file_path" >> "$hypr"
echo "wallpaper = ,$file_path" >> "$hypr"

#setting the wallpaper
echo "preloading wallpaper"
hyprctl hyprpaper preload "$file_path"
echo "setting wallpaper"
hyprctl hyprpaper wallpaper ",$file_path"

echo "copying rofi color schemes"
if [ ! -e "~/.config/rofi/colors.rasi" ]; then
  touch ~/.config/rofi/colors.rasi
fi

echo "generating rofi color template"
printf "@import \"~/.cache/wal/colors-rofi-light\"\nelement-text {\nbackground-color: inherit;\ntext-color: inherit;\n}" > ~/.config/rofi/colors.rasi

hyprctl reload

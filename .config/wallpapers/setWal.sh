#!/bin/bash

file_path=$(zenity --file-selection --title="Select a wallpaper" --filename="$HOME/.config/wallpapers/")
echo "file path: $file_path"
if [ "$file_path" = "" ]; then
  exit 1
fi
conf=~/.config/hypr/hyprpaper.conf

echo "generating color schemas"
wal -i "$file_path"


echo -e "preload=$file_path\nwallpaper=,$file_path" > "$conf"
echo "wallpaper=$file_path"

if [ ! -e "~/.config/rofi/colors.rasi" ]; then
  touch ~/.config/rofi/colors.rasi
fi

echo "copying color schemas"
cp ~/.cache/wal/colors.scss ~/.config/eww/
cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/
cp ~/.cache/wal/colors.json ~/.config/dunst/

echo "generating dunstrc"
background=$(cat ~/.config/dunst/colors.json | jq -r '.special.background')
foreground=$(cat ~/.config/dunst/colors.json | jq -r '.special.foreground')
color=$(cat ~/.config/dunst/colors.json | jq -r '.colors.color1')
low="[urgency_low]\n\tbackground = \"$background\"\n\tforeground = \"$foreground\"\n\tframe_color = \"$foreground\"\n\ttimeout = 10"
normal="[urgency_normal]\n\tbackground = \"$background\"\n\tforeground = \"$foreground\"\n\tframe_color = \"$foreground\"\n\thighlight = \"$color\"\n\ttimeout = 10"
critical="[urgency_critical]\n\tbackground = \"$background\"\n\tforeground = \"$foreground\"\n\tframe_color = \"$color\"\n\ttimeout = 0"

cat ~/.config/dunst/dunstrc.template > ~/.config/dunst/dunstrc
echo -e "\n$low\n\n$normal\n\n$critical" >> ~/.config/dunst/dunstrc

echo "restarting dunst"
killall dunst
dunst &

echo "generating rofi color template"
printf "@import \"~/.cache/wal/colors-rofi-dark.rasi\"\n@import \"~/.config/rofi/rofi.rasi\"\nelement-text {\nbackground-color: inherit;\ntext-color: inherit;\n}" > ~/.config/rofi/colors.rasi

~/eww/target/release/eww reload
killall hyprpaper
hyprpaper

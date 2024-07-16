#!/bin/bash

file_path=$(zenity --file-selection --title="Select a wallpaper" --filename="~/.config/wallpapers/")

wal -i "$file_path"

hyprctl hyprpaper preload "$file_path"
hyprctl hyprpaper wallpaper ",$file_path"

printf "#!/bin/bash\nsleep 5;\nhyprctl hyprpaper preload \"$file_path\" && hyprctl hyprpaper wallpaper \",$file_path\"" > ~/.config/hypr/startup.sh


if [ ! -e "~/.config/rofi/colors-rofi.rasi" ]; then
  touch ~/.config/rofi/colors-rofi.rasi
fi

if [ ! -e "~/.config/rofi/colors.rasi" ]; then
  touch ~/.config/rofi/colors.rasi
fi
cp ~/.cache/wal/colors-rofi-light.rasi ~/.config/rofi/colors-rofi.rasi
printf "@import \"~/.config/rofi/colors-rofi.rasi\"\nelement-text {\nbackground-color: inherit;\ntext-color: inherit;\n}" > ~/.config/rofi/colors.rasi



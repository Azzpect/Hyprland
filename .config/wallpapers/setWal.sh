#!/bin/bash

file_path=$(zenity --file-selection --title="Select a wallpaper" --filename="~/.config/wallpapers/")

hyprctl hyprpaper unload all
wal -i "$file_path"
hyprctl hyprpaper preload "$file_path"
hyprctl hyprpaper wallpaper ",$file_path"

printf "#!/bin/bash\nsleep 5;\nwal -i \"$file_path\"\nhyprctl hyprpaper preload \"$file_path\" && hyprctl hyprpaper wallpaper \",$file_path\"" > ~/.config/hypr/startup.sh



if [ ! -e "~/.config/rofi/colors.rasi" ]; then
  touch ~/.config/rofi/colors.rasi
fi

printf "@import \"~/.cache/wal/colors-rofi-light\"\nelement-text {\nbackground-color: inherit;\ntext-color: inherit;\n}" > ~/.config/rofi/colors.rasi



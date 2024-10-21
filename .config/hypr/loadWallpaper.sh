conf=/home/azzpect/.config/wallpapers/wallpaper.conf
wallpaper=$(sed -n 's/wallpaper=\(.*\)/\1/p' "$conf")
swaybg -i "$wallpaper" &
$SWAY_PID=$!
sleep 1
kill $SWAY_PID

echo "hello"
echo "generating color schemas"
wal -i "$wallpaper"

# Clear previous wallpaper settings
sed -i '/wallpaper=/d' "$conf"

echo "wallpaper=$wallpaper" >> "$conf"
echo "wallpaper=$wallpaper"

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
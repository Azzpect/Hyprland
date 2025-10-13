

genWindowManager() {
  hyprctl -j workspaces | jq '.[].id' > window.txt

  literal=""
  activeWindow=$(hyprctl -j activeworkspace | jq '.id')
  lastWindow=0
  while IFS= read -r window; do
    if [ $window -gt $lastWindow ];then
      lastWindow=$window
    fi
  done < "window.txt"
  i=1
  while [ $i -le $lastWindow ]; do
    thickness=4
    if [ $activeWindow -eq $i ];then
      thickness=7
    fi
    element="(eventbox :onclick \"hyprctl dispatch workspace $i\" (circular-progress :value 100 :class \"circle\" :thickness $thickness))"
    literal+=$element
    ((i++))
  done
  rm "window.txt"
  echo "$literal"
}

"$@"

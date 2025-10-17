eww="$HOME/eww/target/release/eww"

getSongInfo() {
  info=$(curl -s "http://localhost:3000/now-playing")
  poster=$(echo "$info" | jq -r '.item.album.images[-1].url')
  name=$(echo "$info" | jq -r '.item.name')
  artist=$(echo "$info" | jq -r '.item.artists[0].name')

  echo "(box
      :space-evenly false
      (box
            :class \"spotify-img\"
            :style \"background-image: url('${poster}');\"
      )
      (label :text \"${name} - ${artist}\")
    )"
}


"$@"

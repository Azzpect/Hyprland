eww="$HOME/eww/target/release/eww"

getSongInfo() {
  info=$(curl -s "http://localhost:8000/now-playing")
  poster=$(echo "$info" | jq -r '.poster')
  name=$(echo "$info" | jq -r '.name')
  artist=$(echo "$info" | jq -r '.artist')
  isPlaying=$(echo "$info" | jq -r '.isPlaying')

  $eww update isPlaying=$isPlaying

  echo "(box
      :space-evenly false
      (box
            :class \"spotify-img\"
            :style \"background-image: url('${poster}');\"
      )
      (label :text \"${name} - ${artist}\")
    )"
}


play() {
  curl  "http://localhost:3000/play"
}

pause() {
  curl  "http://localhost:3000/pause"
}

next() {
  curl  "http://localhost:3000/next"
}

prev() {
  curl  "http://localhost:3000/prev"
}


"$@"

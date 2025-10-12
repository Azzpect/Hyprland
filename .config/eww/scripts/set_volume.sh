#!/bin/bash

set_output_volume() {
  volume="$1"
  wpctl set-volume @DEFAULT_AUDIO_SINK@ "$(awk "BEGIN {print $volume / 100}")"
}

set_mic_volume() {
  mic="$1"
  wpctl set-volume @DEFAULT_AUDIO_SOURCE@ "$(awk "BEGIN {print $mic / 100}")"
}


"$@"



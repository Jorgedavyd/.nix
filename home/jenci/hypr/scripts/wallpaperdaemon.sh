#!/run/current-system/sw/bin/bash

swww query
if [ $? -eq 1 ]; then
  swww-daemon --format xrgb &

  swww img ~/.local/state/wallpapers/alena-aenami-horizon.png \
    --transition-type "wipe" \
    --transition-duration 1
fi


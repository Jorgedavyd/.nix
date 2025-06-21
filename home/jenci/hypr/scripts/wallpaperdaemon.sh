#!/run/current-system/sw/bin/bash

swww query
if [ $? -eq 1 ]; then
  swww-daemon --format xrgb &

  swww img $HOME/.local/state/wallpaper/sh2-p.png \
    --transition-type "wipe" \
    --transition-duration 1
fi


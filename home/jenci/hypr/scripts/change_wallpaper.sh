#!/run/current-system/sw/bin/bash
WALLPAPER_DIR="$HOME/Pictures/gowall/"
SELECTED=$(ls "$WALLPAPER_DIR" | rofi -dmenu -theme main)
if [ -n "$SELECTED" ]; then
    swww img "$WALLPAPER_DIR/$SELECTED" --transition-type wipe --transition-fps 60
fi

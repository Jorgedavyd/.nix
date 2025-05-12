#!/run/current-system/sw/bin/bash
WALLPAPER_DIR="$HOME/.local/state/wallpapers"
SELECTED=$(ls "$WALLPAPER_DIR" | wofi --dmenu --style ~/.config/wofi/style.css --allow-images)
if [ -n "$SELECTED" ]; then
    swww img "$WALLPAPER_DIR/$SELECTED" --transition-type wipe --transition-fps 60
fi

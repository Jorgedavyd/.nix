#!/run/current-system/sw/bin/bash
QUERY=$(wofi --show drun --style ~/.config/wofi/style.css --allow-images)

if [ -n "$QUERY" ]; then
    DESKTOP_FILE=$(find /run/current-system/sw/share/applications/ -name "*.desktop" -exec grep -l -i "$QUERY" {} \;)
    if [ -z "$DESKTOP_FILE" ]; then
        firefox "https://www.google.com/search?q=$QUERY"
    fi
fi

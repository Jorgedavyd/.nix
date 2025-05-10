if [[ -f $HOME/.bashrc ]]; then
    source $HOME/.bashrc
fi

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec Hyprland
fi

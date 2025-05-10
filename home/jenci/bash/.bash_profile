## Setups the bashrc
if [[ -f $HOME/.bashrc ]]; then
    source $HOME/.bashrc
fi

## Given non-graphical interface on login (in general)
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec Hyprland
fi

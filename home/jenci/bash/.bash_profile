if [[ -f $HOME/.bashrc ]]; then
    source $HOME/.bashrc
fi

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    if [ -z "$XDG_RUNTIME_DIR" ]; then
        export XDG_RUNTIME_DIR=/run/user/$(id -u)
        mkdir -p $XDG_RUNTIME_DIR
        chmod 0700 $XDG_RUNTIME_DIR
    fi
    exec Hyprland
fi

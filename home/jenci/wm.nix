{ pkgs, ... }: {
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd = {
            enable = true;
            enableXdgAutostart = true;
            variables = [ "--all" ];
        };
    };
}

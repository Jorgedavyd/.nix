{config, pkgs, ... }:
{
    security.pam.services.hyrplock = {
        text = ''
            auth include login
            '';
    };
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        xwayland.enable = true;
        systemd.enable = true;
    };
}


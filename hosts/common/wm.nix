_: {
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    environment.sessionVariables = {
        CLUTTER_BACKEND="wayland";
        NIXOS_OZONE_WL="1";
        SDL_VIDEODRIVER="wayland";
        XDG_CURRENT_DESKTOP="Hyprland";
        XDG_SESSION_TYPE="wayland";
        XDG_SESSION_DESKTOP="Hyprland";
        QT_QPA_PLATFORM="wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION="1";
        QT_AUTO_SCREEN_SCALE_FACTOR="1";
        HYPRLAND_NO_SD_NOTIFY="0";
        MOZ_ENABLE_WAYLAND="1";
        GDK_BACKEND="wayland";
    };
}

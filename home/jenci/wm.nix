{ pkgs, ... }: {
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd = {
            enable = true;
            enableXdgAutostart = true;
        };
    };
    home.sessionVariables = {
        AQ_DRM_DEVICES="/dev/dri/card0";
        GBM_BACKEND="nvidia-drm";
        __GL_VRR_ALLOWED="0";
        __GLX_VENDOR_LIBRARY_NAME="nvidia";
        LIBVA_DRIVER_NAME="nvidia";
        NVD_BACKEND="direct";
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
        WLR_NO_HARDWARE_CURSORS="1";
    };
}

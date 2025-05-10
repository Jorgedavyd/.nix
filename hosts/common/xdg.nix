_:
let
    homedirectory = "/home/jenci";
in {
    systemd.user.extraConfig = ''
      RuntimeDirectory=xdg
      RuntimeDirectoryMode=0700
    '';

    environment.variables = {
        XDG_CONFIG_HOME = "${homedirectory}/.config";
        XDG_DATA_HOME = "${homedirectory}/.local/share";
        XDG_CACHE_HOME = "${homedirectory}/.cache";
        XDG_STATE_HOME = "${homedirectory}/.local/state";
    };
    security.pam.services.login.makeHomeDir = true;
    systemd.user.services.xdg-desktop-portal-hyprland = {
        enable = true;
        description = "Portal service for Hyprland";
        wantedBy = [ "graphical-session.target" ];
        serviceConfig = {
            Type = "dbus";
            BusName = "org.freedesktop.impl.portal.desktop.hyprland";
            ExecStart = "${pkgs.xdg-desktop-portal-hyprland}/libexec/xdg-desktop-portal-hyprland";
            Restart = "on-failure";
        };
    };

    systemd.tmpfiles.rules = [
        "d /run/user 0755 root root -"
    ];
}

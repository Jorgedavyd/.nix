{
...
}:

{
    boot.loader.grub = {
        enable = true;
        devices = [ "/dev/nvme0n1" ];
    };
    services = {
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
        openssh.enable = true;
        onedrive.enable = true;
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

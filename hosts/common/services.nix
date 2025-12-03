{ pkgs, ... }:
{
    services = {
        pulseaudio.enable = false;
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
        openssh.enable = true;
        seatd.enable = true;
        dbus.enable = true;
        gnome.gnome-keyring.enable = true;
        gnome.glib-networking.enable = true;
    };
    systemd.user.services.onedrive = {
        enable = true;
        unitConfig = {
            Description = "OneDrive Client";
            RequiresMountFor = "/data";
            After = [ "network-online.target" ];
        };
        serviceConfig = {
            ExecStart = "${pkgs.onedrive}/bin/onedrive --monitor";
            Restart = "on-failure";
            RestartSec = 5;
            ProtectSystem = "no";
            ProtectHome = false;
        };

        wantedBy = [ "default.target" ];
    };
}

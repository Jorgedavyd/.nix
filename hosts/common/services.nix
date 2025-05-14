{ pkgs, ... }:
{
    services = {
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
            Description = "OneDrive client for Linux";
            RequiresMountFor = "/data";
        };
        serviceConfig = {
            ProtectSystem = "full";
            ProtectHostname = true;
            ProtectKernelTunables = true;
            ProtectControlGroups = true;
            RestrictRealtime = true;
            Group = "users";
            ExecStart= ''${pkgs.onedrive}/bin/onedrive --monitor --syncdir /data/OneDrive'';
            Restart = "on-failure";
            RestartSec = 3;
            RestartPreventExitStatus = 126;
            TimeoutStopSec = 90;
        };
        wantedBy = [ "default.target" ];
    };
}

_: {
    services = {
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
        openssh.enable = true;
        onedrive.enable = true;
        seatd.enable = true;
        dbus.enable = true;
        gnome.gnome-keyring.enable = true;
        gnome.glib-networking.enable = true;
    };
}

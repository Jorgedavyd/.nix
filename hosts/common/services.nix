{ pkgs, ... }: {
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
	    Unit = {
		    Description = "OneDrive cloud sync service";
		    After = [ "network.target" ];
	    };

	    Service = {
		    ExecStart = "${pkgs.onedrive}/bin/onedrive --monitor --resync";
		    Restart = "on-failure";
	    };

	    Install = {
		    WantedBy = [ "default.target" ];
	    };
    };

}

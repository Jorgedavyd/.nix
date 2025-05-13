{ pkgs, ... }: {
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

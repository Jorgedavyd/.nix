_: {
    services.xserver = {
        enable = true;
        videosDrivers = ["nvidia"];
        displayManager.gdm = {
            enable = true;
            wayland = true;
        };
    };
}

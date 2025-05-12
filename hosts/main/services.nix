_: {
    services.xserver = {
        videoDrivers = [ "nvidia" ];
        displayManager = {
            gdm = {
                enable = true;
                wayland = true;
            };
        };
    };
}

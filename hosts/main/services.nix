_: {
    services.xserver.videoDrivers = [ "nvidia" ];
    virtualisation.docker = {
        enable = true;
        enableNvidia = true;
    };
}

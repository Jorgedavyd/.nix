_: {
    services.xserver.videoDrivers = [ "nvidia" ];
    virtualisation.docker.enable = true;
    hardware.nvidia-container-toolkit.enable = true;
}

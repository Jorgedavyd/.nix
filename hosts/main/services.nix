_: {
    services.xserver = {
        enable = true;
        videoDrivers = [ "nvidia" "amdgpu" ];
    };
}

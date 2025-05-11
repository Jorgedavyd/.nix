_: {
    services.xserver = {
        enable = true;
        videoDrivers = [ "nvidia" "amdgpu" ];
        displayManager.gdm = {
            enable = true;
            wayland = true;
        };
    };
}

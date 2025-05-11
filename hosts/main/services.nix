_: {
    services.xserver = {
        enable = true;
        videosDrivers = [ "nvidia" "amdgpu" ];
        displayManager.gdm = {
            enable = true;
            wayland = true;
        };
    };
}

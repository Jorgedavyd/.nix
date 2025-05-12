{ config, ... }: {
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement = {
            enable = false;
            finegrained = false;
        };
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    boot.kernelParams = [ "nvidia-drm.modeset=1" ];
    boot.blacklistedKernelModules = [ "nouveau" "nvidiafb" ];
}

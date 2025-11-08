{ config, pkgs, ... }: {
    hardware.opengl.extraPackages = [
        pkgs.nvidia-vaapi-driver
    ];
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
    boot.blacklistedKernelModules = [ "nouveau" "nvidiafb" ];
}

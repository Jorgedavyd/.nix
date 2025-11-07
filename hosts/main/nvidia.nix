{ config, ... }: {
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement = {
            enable = false;
            finegrained = false;
        };
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
    boot.blacklistedKernelModules = [ "nouveau" "nvidiafb" ];
}

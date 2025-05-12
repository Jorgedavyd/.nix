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
    boot.extraModprobeConfig = ''
    options nvidia-drm modeset=1
    options nvidia-drm fbdev=1
    options nvidia NVreg_UsePageAttributeTable=1
    options nvidia NVreg_PreserveVideoMemoryAllocations=1
    options nvidia NVreg_TemporaryFilePath=/var/tmp
    '';
    boot.blacklistedKernelModules = [ "nouveau" "nvidiafb" ];
}

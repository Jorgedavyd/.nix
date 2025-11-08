{ pkgs, lib, ... }: {
    hardware.opengl.extraPackages = [
        pkgs.nvidia-vaapi-driver
    ];
    hardware.nvidia = {
        modesetting.enable = lib.mkDefault true;
        powerManagement.enable = true;
        open = true;
    };
    boot.blacklistedKernelModules = [ "nouveau" "nvidiafb" ];
}

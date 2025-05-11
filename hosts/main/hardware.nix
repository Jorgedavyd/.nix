{
config,
lib,
...
}:

{
    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.initrd.systemd.enable = true;
    boot.kernelModules = [ "kvm-amd" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    boot.extraModulePackages = [ ];
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement = {
            enable = true;
            finegrained = false;
        };
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
    boot.extraModprobeConfig = ''
    options nvidia-drm modeset=1
    options nvidia-drm fbdev=1
    '';
    # options nvidia NVreg_UsePageAttributeTable=1
    # options nvidia NVreg_PreserveVideoMemoryAllocations=1
    # options nvidia NVreg_TemporaryFilePath=/var/tmp
    # options nvidia NVreg_EnableS0ixPowerManagement=1
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

{
config,
pkgs,
lib,
...
}:

{
    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ "kvm-amd" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    boot.initrd.systemd.enable = true;
    boot.extraModulePackages = [ ];

    ## NVIDIA configuration
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

    ## Linux firmware
    hardware.firmware = [ pkgs.linux-firmware ];
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    boot.kernelParams = [
        "acpi.debug_level=0x2"
        "acpi.debug_layer=0xFFFFFFFF"
        "acpi_osi=Linux"
        "pcie_port_pm=off"
    ];
}

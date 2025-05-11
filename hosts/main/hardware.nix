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

    ## NVIDIA configuration
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement = {
            enable = false;
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

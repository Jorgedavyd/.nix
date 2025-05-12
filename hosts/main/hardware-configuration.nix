{
config,
pkgs,
lib,
...
}:

{
    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    boot.initrd.systemd.enable = true;
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    boot.extraModulePackages = [ ];

    ## Linux firmware
    hardware.firmware = [ pkgs.linux-firmware ];
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    boot.kernelParams = [
        "acpi.debug_level=0x2"
        "acpi.debug_layer=0xFFFFFFFF"
        "acpi_osi=Linux"
        "pcie_port_pm=off"
    ];
    fileSystems."/" = {
        device = "/dev/disk/by-label/NIXROOT";
        fsType = "ext4";
        options = [ "defaults" "noatime" ];
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-label/NIXBOOT";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
    };

    fileSystems."/data" = {
        device = "/dev/disk/by-label/NIXDATA";
        fsType = "ext4";
        options = [ "defaults" "noatime" ];
    };

    swapDevices = [ ];
}

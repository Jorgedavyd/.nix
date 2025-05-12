{
config,
pkgs,
lib,
...
}:

{
    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];
    hardware.graphics.extraPackages = with pkgs; [ vpl-gpu-rt intel-media-driver intel-compute-runtime ];
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    fileSystems."/" = {
        device = "/dev/nvme0n1p1";
        fsType = "ext4";
        options = [ "defaults" "noatime" ];
    }; ## 400 Gib

    fileSystems."/boot" = {
        device = "/dev/nvme0n1p2";
        fsType = "vfat";
        options = [ "defaults" "umask=0077" ]; ## cambiar
    }; ## 2Gib

    fileSystems."/data" = {
        device = "/dev/nvme0n1p3";
        fsType = "ext4";
        options = [ "defaults" "noatime" ];
    }; ## aprox: 100Gib

    swapDevices = [ ]; ## aprox: 4Gib
}

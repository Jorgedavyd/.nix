{
config,
lib,
...
}:

{
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.initrd.systemd.enable = true;
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];
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
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

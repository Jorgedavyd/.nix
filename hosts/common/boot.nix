_: {
    boot.loader.systemd-boot.enable = true;
    boot.loader.grub.devices = [ "/dev/nvme0n1" ];
    boot.loader.efi.canTouchEfiVariables = true;
}

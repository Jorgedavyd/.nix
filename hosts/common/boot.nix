_: {
    boot.loader.systemd-boot.enable = true;
    boot.loader.grub = {
        enable = true;
        devices = [ "/dev/nvme0n1" ];
    };
    boot.loader.efi.canTouchEfiVariables = true;
}

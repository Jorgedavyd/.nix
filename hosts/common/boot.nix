_: {
    boot.loader = {
        efi.canTouchEfiVariables = true;
        grub.enable = true;
        grub.efiSupport = true;
        grub.device = "nodev";
    };
}


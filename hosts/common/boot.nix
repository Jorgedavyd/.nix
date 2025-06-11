_: {
    boot.loader.systemd-boot.enable = true;
    boot.loader.grub.devices = [ "/dev/nvme0n1" ];
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernel.sysctl = {
        "net.ipv4.conf.eth0.forwarding" = 1;    # enable port forwarding
    };
}

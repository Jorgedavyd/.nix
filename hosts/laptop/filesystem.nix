_: {
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

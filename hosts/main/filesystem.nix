{
  ...
}:

{
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

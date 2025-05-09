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
    device = "/dev/disk/by-uuid/a14e645d-f187-4dab-86c2-5224c06bd8c5";
    fsType = "ext4";
    options = [ "defaults" "noatime" ];
  };

  swapDevices = [ ];
}

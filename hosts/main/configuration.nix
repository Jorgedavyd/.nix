{
inputs,
outputs,
pkgs,
config,
lib,
timezone,
locale,
username,
...
}:

{
    imports = [
        ../common/default.nix
        ./hardware.nix
        ./cuda.nix
        ./networking.nix
        ./wm.nix
        ./filesystem.nix
    ];
}

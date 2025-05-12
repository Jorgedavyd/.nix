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
        ./hardware-configuration.nix
        ./cuda.nix
        ./networking.nix
        ./wm.nix
        ./nvidia.nix
        ./services.nix
    ];
}

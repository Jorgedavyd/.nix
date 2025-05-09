{
config,
inputs,
outputs,
lib,
pkgs,
username,
locale,
timezone,
...
}:

{
    imports = [
        ../common/default.nix
        ./hardware.nix
        ./networking.nix
        ./filesystem.nix
        ./services.nix
    ];

    system.stateVersion = "24.11";
}

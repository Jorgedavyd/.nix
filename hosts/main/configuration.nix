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
        ./services.nix
        ./networking.nix
        ./filesystem.nix
    ];
}

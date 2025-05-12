{
pkgs,
lib,
modulesPath,
...
}:

{
    imports = [
        ./hardware.nix
        ./boot.nix
        ./networking.nix
        ./packages.nix
        ./services.nix
        ./user.nix
        ./home-manager.nix
    ];
    system.stateVersion = "24.11";
}

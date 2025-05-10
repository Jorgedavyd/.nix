{
pkgs,
lib,
...
}:

{
    imports = [
        ./hardware.nix
        ./networking.nix
        ./kernel.nix
        ./packages.nix
        ./services.nix
        ./user.nix
        ./home-manager.nix
    ];
    system.stateVersion = "24.11";
}

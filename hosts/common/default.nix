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
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "24.11";
}

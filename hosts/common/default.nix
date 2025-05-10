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
        ./wayland.nix
        ./packages.nix
        ./services.nix
        ./user.nix
        ./home-manager.nix
        ./xdg.nix
    ];
    system.stateVersion = "24.11";
}

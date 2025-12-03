_: {
    imports = [
        ./hardware.nix
        ./boot.nix
        ./networking.nix
        ./packages.nix
        ./services.nix
        ./user.nix
        ./home-manager.nix
        ./wm.nix
    ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.11";
}

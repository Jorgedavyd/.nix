_: {
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

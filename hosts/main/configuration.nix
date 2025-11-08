_: {
    imports = [
        ../common/default.nix
        ./hardware-configuration.nix
        ./cuda.nix
        ./wm.nix
        ./nvidia.nix
        ./services.nix
    ];
}

final: prev: {
    nsight_systems = final.callPackage ./cuda/nsight_systems.nix {};
    nsight_compute = final.callPackage ./cuda/nsight_compute.nix {};
    cudnn = final.callPackage ./cuda/cudnn.nix {};
}

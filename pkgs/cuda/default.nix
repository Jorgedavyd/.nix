final: prev: {
    nsight_systems = final.callPackage ./cuda/nsight_systems.nix {};
    nsight_compute = final.callPackage ./cuda/nsight_compute.nix {};
    cudnn = final.callPackage ./cuda/cudnn.nix {};
    tensor_rt = final.callPackage ./cuda/tensor_rt.nix {};
    cublas = final.callPackage ./cuda/cublas.nix {};
    cufft = final.callPackage ./cuda/cufft.nix {};
    cutensor = final.callPackage ./cuda/cutensor.nix {};
}

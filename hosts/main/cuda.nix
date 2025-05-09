{
pkgs,
cudapackages,
...
}:

{
    environment.systemPackages = with pkgs; [
        paraview  ## modeling
        cudapackages.nsight_systems cudapackages.nsight_compute cudapackages.nsight_vse
        cudapackages.tensorrt cudapackages.cudnn cudapackages.cudatoolkit ## base deep learning and cuda
    ];
}

{
pkgs,
modulesPath,
lib,
...
}:

{
    imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.pulseaudio.enable = false;
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
}

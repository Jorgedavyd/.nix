{
pkgs,
modulesPath,
lib,
...
}:

{
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.pulseaudio.enable = false;
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
}

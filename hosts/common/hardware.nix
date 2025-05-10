{
pkgs,
modulesPath,
...
}:

{
    imports = [ (modulesPath + "/installed/scan/not-detected.nix") ];
    hardware.pulseaudio.enable = false;
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
}

{
pkgs,
...
}:

{
    hardware.pulseaudio.enable = false;
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
}

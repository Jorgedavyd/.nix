{
...
}:

{
    boot.loader.grub = {
        enable = true;
        devices = [ "/dev/nvme0n1" ];
    };
    services = {
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
        openssh.enable = true;
        onedrive.enable = true;
        displayManager = {
            enable = true;
            defaultSession = "hyprland";
        };
    };
}

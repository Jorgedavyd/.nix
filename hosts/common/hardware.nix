_: {
    hardware.pulseaudio.enable = false;
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
    boot.kernel.sysctl = {
        "net.ipv4.conf.eth0.forwarding" = 1;    # enable port forwarding
    };
}

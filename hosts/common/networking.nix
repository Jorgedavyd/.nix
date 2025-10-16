{ hostname, ... }: {
    networking = {
        networkmanager.enable = true;
        firewall.enable = true;
        firewall.allowedTCPPorts = [ 3001 ];
        nameservers = [ "8.8.8.8" "8.8.4.4" ];
        hostName = hostname;
        useNetworkd = false;
        enableIPv6 = true;
    };
    boot.kernel.sysctl = {
        "net.ipv4.conf.eth0.forwarding" = 1;    # enable port forwarding
    };
}

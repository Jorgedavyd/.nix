{ hostname, ... }: {
    networking = {
        networkmanager.enable = true;
        firewall.enable = true;
        # firewall.allowedTCPPorts = [ 80 ]; Set this up
        nameservers = [ "8.8.8.8" "8.8.4.4" ];
        defaultGateway = "192.168.100.1";
        hostName = hostname;
    };
}

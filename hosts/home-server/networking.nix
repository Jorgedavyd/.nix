_: {
    networking = {
        hostName = "home-server";
        firewall = {
            enable = true;
            allowedTCPPorts = [ 22 80 8080 90 9090 ];
        };
    };
}

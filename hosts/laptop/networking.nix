_: {
    networking = {
        interfaces = {
            wlan0.ipv4.addresses = [{
                address = "192.168.100.100";
                prefixLength = 24;
            }];
            eth0.ipv4.addresses = [{
                address = "192.168.100.101";
                prefixLength = 24;
            }];
        };
        wireless.enable = true;
    };
}

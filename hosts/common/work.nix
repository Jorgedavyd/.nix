{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [ teams-for-linux ];
    services.openvpn.servers.officeVPN  = { config = '' config /root/nixos/openvpn/officeVPN.conf ''; };
}

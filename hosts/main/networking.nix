{
  pkgs,
  ...
}:

{
  networking = {
    interfaces.eth0.ipv4.addresses = [{
      address = "192.168.100.150";
      prefixLength = 24;
    }];
  };
}

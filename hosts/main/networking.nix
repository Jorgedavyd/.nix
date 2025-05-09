{
  pkgs,
  ...
}:

{
  networking = {
    interfaces.eth0.ipv4.addresses = [{
      address = "192.168.100.100";
      prefixLength = 24;
    }];
  };
}

{
pkgs,
...
}:

{
    environment.systemPackages = with pkgs; [
        vim curl wget firefox git nix dconf gh
        linux-firmware
        inxi dmidecode acpica-tools
    ];
}

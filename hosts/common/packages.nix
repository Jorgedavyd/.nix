{
pkgs,
...
}:

{
    environment.systemPackages = with pkgs; [
        vim curl wget firefox git nix dconf
    ];
}

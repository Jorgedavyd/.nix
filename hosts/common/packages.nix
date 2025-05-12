{
pkgs,
...
}:

{
    environment.systemPackages = with pkgs; [
        vim curl wget git nix dconf gh
    ];
}

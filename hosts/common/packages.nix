{
pkgs,
...
}:

{
    environment.systemPackages = with pkgs; [
        vim curl wget git nix dconf gh
        hyprland libsForQt5.qt5.qtwayland libsForQt5.qt5ct libva
        xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
    ];
}

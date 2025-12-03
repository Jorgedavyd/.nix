{
pkgs,
...
}:

{
    environment.systemPackages = with pkgs; [
        vim curl wget git nix gh
        hyprland libsForQt5.qt5.qtwayland libsForQt5.qt5ct
        xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
    ];
}

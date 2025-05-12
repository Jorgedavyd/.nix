{
pkgs,
...
}:

{
    environment.systemPackages = with pkgs; [
        vim curl wget git nix dconf gh
        hyprland qt5.qtwayland qt5ct libva
        libva-nvidia-driver xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
    ];
}

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
    dconf.settings = {
        "org/gnome/desktop/interface" = {
            cursor-theme = "Bibata-Modern-Ice";
            cursor-size = 20;
            font-name = "JetBrainsMono Nerd Font 9";
            document-font-name = "JetBrainsMono Nerd Font 9";
            monospace-font-name = "JetBrainsMono Nerd Font 9";
            font-antialiasing = "rgba";
            font-hinting = "full";
            color-scheme = "prefer-dark";
        };
    };
}

{ pkgs, ... }:
{

    home.pointerCursor = {
        name = "rose-pine-cursor";
        gtk.enable = true;
        size = 24;
        package = pkgs.rose-pine-cursor;
    };

    gtk = {
        enable = true;
        font = {
            name = "JetBrains Mono Nerd Font";
            size = 10;
        };
        iconTheme = {
            package = pkgs.rose-pine-icon-theme;
            name = "rose-pine";
        };
        theme = {
            package = pkgs.rose-pine-gtk-theme;
            name = "rose-pine";
        };
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk";
        style = {
            name = "kvantum";
            package = pkgs.libsForQt5.qtstyleplugin-kvantum;
        };
    };
}

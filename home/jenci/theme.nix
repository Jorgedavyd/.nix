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
}

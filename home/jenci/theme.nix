{ pkgs, ... }:
{
    home.sessionVariables = {
        XCURSOR_THEME = "Bibata-Modern-Ice";
        XCURSOR_SIZE = "20";
    };

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
    gtk = {
        enable = true;
        theme.name = "Adwaita-dark";
        cursorTheme.name = "Bibata-Modern-Ice";
        cursorTheme.size = 20;
        font.name = "JetBrainsMono Nerd Font 9";
    };

}


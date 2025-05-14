{ pkgs, config, ... }:
{
    xdg = {
        enable = true;
        configHome = "${config.home.homeDirectory}/.config";
        dataHome = "${config.home.homeDirectory}/.local/share";
        cacheHome = "${config.home.homeDirectory}/.cache";
        stateHome = "${config.home.homeDirectory}/.local/state";
        configFile = {
            "nvim".source = ./nvim;
            "starship.toml".source = ./starship/starship.toml;
            "ghostty/config".source = ./ghostty/config;
            "tmux/tmux.conf".source = ./tmux/tmux.conf;
            "zathura/zathurarc".source = ./zathura/zathurarc;
            "hypr".source = ./hypr;
            "waybar".source = ./waybar;
            "rofi".source = ./rofi;
        };
        userDirs = {
            enable = true;
            createDirectories = true;
            desktop = "${config.home.homeDirectory}/Desktop";
            documents = "${config.home.homeDirectory}/Documents";
            download = "${config.home.homeDirectory}/Downloads";
            music = "${config.home.homeDirectory}/Music";
            pictures = "${config.home.homeDirectory}/Pictures";
            videos = "${config.home.homeDirectory}/Videos";
            extraConfig = {
                XDG_PROJECTS_DIR = "${config.home.homeDirectory}/projects";
            };
        };
        portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal
                xdg-desktop-portal-gtk
            ];
            configPackages = with pkgs; [
                xdg-desktop-portal
                xdg-desktop-portal-gtk
                xdg-desktop-portal-hyprland
            ];
        };
    };
}

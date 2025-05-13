{ pkgs, ... }:
let
    homedirectory = "/home/jenci";
in {
    xdg = {
        enable = true;
        configHome = "${homedirectory}/.config";
        dataHome = "${homedirectory}/.local/share";
        cacheHome = "${homedirectory}/.cache";
        stateHome = "${homedirectory}/.local/state";
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
            desktop = "${homedirectory}/Desktop";
            documents = "${homedirectory}/Documents";
            download = "${homedirectory}/Downloads";
            music = "${homedirectory}/Music";
            pictures = "${homedirectory}/Pictures";
            videos = "${homedirectory}/Videos";
            extraConfig = {
                XDG_PROJECTS_DIR = "${homedirectory}/projects";
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

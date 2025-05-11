{ pkgs, inputs, ... }:
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
            "waybar".source = ./waybar;
            "ghostty/config".source = ./ghostty/config;
            "tmux/tmux.conf".source = ./tmux/tmux.conf;
            "zathura/zathurarc".source = ./zathura/zathurarc;
            "hypr".source = ./hypr;
            "Kvantum/kvantum.kvconfig".source = ./Kvantum/kvantum.kvconfig;
            "Kvantum/KvLibadwaita-RosePine/KvLibadwaita-RosePine.kvconfig".source = ./Kvantum/KvLibadwaita-RosePine/KvLibadwaita-RosePine.kvconfig;
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
            ];
        };
    };
}

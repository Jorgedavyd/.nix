{ config, pkgs, inputs, ... }:
{
    programs.home-manager.enable = true;
    home.username = "jenci";
    home.homeDirectory = "/home/jenci";
    home.stateVersion = "24.11";
    home.sessionVariables.TERM = "ghostty";
    imports = [
        ./programs.nix
        ./shell.nix
        ./xdg.nix
        ./editor.nix
        ./wallpapers.nix
    ];

    home.file = {
        ".config/nvim" = {
            source = ./nvim;
            recursive = true;
        };

        ".config/starship.toml".source = ./starship/starship.toml;

        ".config/ghostty" = {
            source = ./ghostty;
            recursive = true;
        };

        ".config/tmux" = {
            source = ./tmux;
            recursive = true;
        };

        ".config/zathura" = {
            source = ./zathura;
            recursive = true;
        };

        ".config/hypr" = {
            source = ./hypr;
            recursive = true;
        };

        ".config/waybar" = {
            source = ./waybar;
            recursive = true;
        };

        ".config/rofi" = {
            source = ./rofi;
            recursive = true;
        };
}

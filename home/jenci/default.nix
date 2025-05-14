{ inputs, config, pkgs, ... }:
{
    programs.home-manager.enable = true;
    home.username = "jenci";
    home.homeDirectory = "/home/jenci";
    home.stateVersion = "24.11";
    home.extraSpecialArgs = { inherit inputs; };
    home.sessionVariables.TERM = "ghostty";
    imports = [
        ./programs.nix
        ./shell.nix
        ./xdg.nix
        ./editor.nix
        ./wallpapers.nix
    ];

    programs.neovim = {
        enable = true;
        package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    };


    home.file = {

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
    };
}

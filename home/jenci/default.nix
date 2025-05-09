{ config, pkgs, inputs, username, ... }:

{
    programs.home-manager.enable = true;
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "24.11";
    home.sessionVariables.TERM = "ghostty";
    imports = [
        ./programs.nix
        ./shell.nix
        ./theme.nix
        ./xdg.nix
        ./fonts.nix
        ./swww.nix
    ];
}

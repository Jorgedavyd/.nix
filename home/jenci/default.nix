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
        ./wm.nix
        ./theme.nix
        ./xdg.nix
        ./swww.nix
    ];
}

_: {
    programs.home-manager.enable = true;
    home.username = "jenci";
    home.homeDirectory = "/home/jenci";
    home.stateVersion = "24.11";
    home.sessionVariables.TERM = "ghostty";
    imports = [
        ./programs.nix
        ./xdg.nix
        ./shell.nix
        ./editor.nix
        ./wallpapers.nix
    ];
}

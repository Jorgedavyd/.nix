_: {
    programs.home-manager.enable = true;
    home.username = "jenci";
    home.homeDirectory = "/home/jenci";
    home.stateVersion = "25.05";
    home.sessionVariables.TERM = "ghostty";
    imports = [
        ./programs.nix
        ./xdg.nix
        ./shell.nix
        ./editor.nix
        ./code.nix
        ./browser.nix
        ./git.nix
        ./wallpapers.nix
    ];
}

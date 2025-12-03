_: {
    programs.home-manager.enable = true;
    home.username = "jenci";
    home.homeDirectory = "/home/jenci";
    home.stateVersion = "25.11";
    home.sessionVariables.TERM = "ghostty";
    imports = [
        ./programs.nix
        ./xdg.nix
        ./shell.nix
        ./code.nix
        ./browser.nix
        ./git.nix
        ./wallpapers.nix
    ];
}

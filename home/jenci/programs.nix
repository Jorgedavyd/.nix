{ pkgs, ...}: {
    home.packages = with pkgs; [
        yq jq gnused gawk fzf findutils rsync fd ripgrep bat tldr entr # cli
        gnutar zip unzip # compression
        traceroute nettools nmap # networking
        texliveFull zathura # latex
        hyprlock rofi-wayland grim grimblast swww waybar wl-clipboard # ui-ux
        xdg-desktop-portal-hyprland xdg-desktop-portal xdg-utils xdg-user-dirs # ui-theme
        xdg-desktop-portal-gtk bibata-cursors # cursors
        sfmono-liga blexmono-liga nerd-fonts.jetbrains-mono nerd-fonts.iosevka # fonts
        pavucontrol pamixer brightnessctl btop nvtopPackages.nvidia # monitoring
        obsidian ghostty tmux # code
        onedrive # file-manager
        nix-prefetch-scripts nix-prefetch-github nix-prefetch-git nix-prefetch-docker # derivation utils
        gimp3 ## image editor
        openfortivpn openfortivpn-webview
    ];

    fonts.fontconfig.enable = true;

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
    };
}

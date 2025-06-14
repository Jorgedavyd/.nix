{ pkgs, ...}: {
    home.packages = with pkgs; [
        yq jq gnused gawk fzf findutils rsync fd ripgrep bat tldr
        gnutar zip unzip
        traceroute nettools nmap
        texliveFull zathura
        hyprlock rofi-wayland grim grimblast swww gowall waybar starship wl-clipboard
        xdg-desktop-portal-hyprland xdg-desktop-portal xdg-utils xdg-user-dirs
        pavucontrol pamixer brightnessctl btop nvtopPackages.nvidia
        obsidian ghostty tmux llama-cpp
        xdg-desktop-portal-gtk bibata-cursors
        sfmono-liga blexmono-liga nerd-fonts.jetbrains-mono nerd-fonts.iosevka
        onedrive
    ];

    fonts.fontconfig.enable = true;

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
    };
}

{ pkgs, ...}: {
    home.packages = with pkgs; [
        yq jq gnused gawk fzf findutils rsync fd ripgrep bat tldr
        gnutar zip unzip
        traceroute nettools nmap
        texliveFull zathura
        hyprlock rofi-wayland grim grimblast swww gowall waybar starship wl-clipboard
        xdg-desktop-portal-hyprland xdg-desktop-portal xdg-utils xdg-user-dirs
        pavucontrol pamixer brightnessctl btop nvtopPackages.nvidia
        obsidian ghostty tmux
        xdg-desktop-portal-gtk bibata-cursors
        onedrive
        sfmono-liga blexmono-liga nerd-fonts.jetbrains-mono nerd-fonts.iosevka
    ];

    fonts.fontconfig.enable = true;

    programs = {
        firefox = {
            enable = true;
            profiles.jenci = {
                isDefault = true;
                userChrome = ''
          @import "${builtins.fetchGit {
                        url = "https://github.com/rockofox/firefox-minima";
                        ref = "main";
                        rev = "dc40a861b24b378982c265a7769e3228ffccd45a";
                    }}/userChrome.css";
          .tabbrowser-tab .tab-label {
            font-family: JetBrains Nerd Font Mono !important;
            font-size: 14px !important;
          }
                '';
                settings = {
                    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                    "browser.translations.automaticallyPopup" = false;
                    "browser.cache.disk.enable" = false;
                };
            };
        };
        git = {
            enable = true;
            userName = "Jorgedavyd";
            userEmail = "jorged.encyso@gmail.com";
            extraConfig = {
                init.defaultBranch = "main";
                pull.rebase = true;
                credential.helper = "!gh auth git-credential";
            };
        };
        direnv = {
            enable = true;
            nix-direnv.enable = true;
        };
    };
}

{ pkgs, ...}:

{
    home.packages = with pkgs; [
        yq jq gnused gawk fzf findutils rsync fd ripgrep bat tldr
        traceroute nettools nmap
        texliveFull zathura
        hyprland hyprlock rofi grim grimblast swww waybar starship
        pavucontrol pamixer brightnessctl btop nvtopPackages.nvidia
        obsidian ghostty tmux
        xdg-utils xdg-user-dirs
        libsForQt5.qtstyleplugin-kvantum
        rose-pine-gtk-theme
        rose-pine-icon-theme
        rose-pine-cursor
    ];

    programs = {
        firefox = {
            enable = true;
            profiles.${username} = {
                isDefault = true;
                userChrome = ''
          @import "${builtins.fetchGit {
                        url = "https://github.com/rockofox/firefox-minima";
                        ref = "main";
                        rev = "dc40a861b24b378982c265a7769e3228ffccd45a";
                    }}/userChrome.css";
          .tabbrowser-tab:first-child { counter-reset: nth-tab 0 }
          .tab-text::before { content: counter(nth-tab) " | "; counter-increment: nth-tab }
          .tabbrowser-tab .tab-label {
            font-family: FiraCode Nerd Font Mono !important;
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
            };
        };
        neovim = {
            enable = true;
            extraPackages = with pkgs; [
                rust-analyzer zls rustfmt clang-tools pyright lua-language-server stylua jdt-language-server nil
                lldb
                nodejs gcc
            ];
        };
        direnv = {
            enable = true;
            nix-direnv.enable = true;
        };
    };
}

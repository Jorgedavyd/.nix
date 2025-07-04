{ inputs, username, pkgs, ... }: {
    imports = [
        inputs.home-manager.nixosModules.home-manager
        inputs.nixos-wsl.nixosModules.default
        ./packages.nix
        ./services.nix
        ../common/user.nix
        ../common/work.nix
    ];

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        users.${username} = _: {
            programs.home-manager.enable = true;
            home.username = "${username}";
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "25.05";
            imports = [
                ../../home/${username}/editor.nix
                ../../home/${username}/shell.nix
                ../../home/${username}/xdg.nix
            ];
            home.packages = with pkgs; [
                yq jq gnused gawk fzf findutils rsync fd ripgrep bat tldr
                gnutar zip unzip
                traceroute nettools nmap
                texliveFull zathura
                tmux starship
            ];

            programs = {
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
        };
        extraSpecialArgs = { inherit inputs; };
    };
    wsl.enable = true;
    wsl.defaultUser = "${username}";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.05";
}

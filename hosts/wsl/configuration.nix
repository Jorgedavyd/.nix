{ inputs, username, pkgs, ... }: {
    imports = [
        inputs.home-manager.nixosModules.home-manager
        inputs.nixos-wsl.nixosModules.default
        ./packages.nix
        ./services.nix
        ../common/user.nix
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
                ../../home/${username}/code.nix
            ];
            home.packages = with pkgs; [
                yq jq gnused gawk fzf findutils rsync fd ripgrep bat tldr # cli
                gnutar zip unzip # compression
                traceroute nettools nmap # networking
                btop # monitoring
                ghostty tmux # code
                nix-prefetch-scripts nix-prefetch-github nix-prefetch-git nix-prefetch-docker # derivation utils
            ];

            programs = {
                git = {
                    enable = true;
                    userName = "Enciso Martinez, Jorge David";
                    userEmail = "jorge.enciso@tigo.net.py";
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

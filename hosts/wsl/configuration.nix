{ inputs, username, ... }: {
    imports = [
        <nixos-wsl/modules>
        inputs.home-manager.nixosModules.home-manager
        ./packages.nix
        ../common/networking.nix
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
            home.stateVersion = "24.11";
            home.sessionVariables.TERM = "ghostty";
            imports = [
                ../../home/${username}/editor.nix
                ../../home/${username}/shell.nix
                ../../home/${username}/xdg.nix
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
}

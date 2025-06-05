{
    description = "Jenci's NixOS configuration for main-pc, laptop, server, and WSL";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
        dev-pkgs.url = "github:jorgedavyd/nix-dev";
        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    };

    outputs = { self, nixpkgs, home-manager, neovim-nightly-overlay, dev-pkgs, nixos-wsl, ... }@inputs:
        let
            inherit (nixpkgs) lib;

            system = "x86_64-linux";

            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
                overlays = [
                    neovim-nightly-overlay.overlays.default
                    dev-pkgs.overlays.default
                ];
            };

            defaultSettings = {
                username = "jenci";
                hostname = "nixos";
                cudapackages = pkgs.cudaPackages;
                timezone = "America/Asuncion";
                locale = "en_US.UTF-8";
            };

            # Host-specific configurations
            hosts = {
                main = {
                    modules = [ ./hosts/main/configuration.nix ];
                    settings = { hostname = "main-nixos"; }; # Override default hostname
                };
                server = {
                    modules = [ ./hosts/server/configuration.nix ];
                    settings = { hostname = "server-nixos"; };
                };
                laptop = {
                    modules = [ ./hosts/laptop/configuration.nix ];
                    settings = { hostname = "laptop-nixos"; };
                };
                wsl = {
                    modules = [ ./hosts/wsl/configuration.nix ];
                    settings = { hostname = "wsl-nixos"; };
                };
            };

            mkSystem = hostName: hostConfig:
                lib.nixosSystem {
                    inherit pkgs;
                    specialArgs = {
                        inherit self inputs;
                        outputs = self.outputs;
                    } // defaultSettings // hostConfig.settings;
                    modules = hostConfig.modules;
                };

        in {
            nixosConfigurations = lib.mapAttrs mkSystem hosts;
        };
}

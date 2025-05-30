{
    description = "Jenci's NixOS configuration for main-pc and laptop";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
        dev-pkgs.url = "github:jorgedavyd/nix-dev";
    };

    outputs = { self, nixpkgs, home-manager, neovim-nightly-overlay, dev-pkgs, ... }@inputs:
        let
            inherit (nixpkgs) lib;
            inherit (self) outputs;
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
                overlays = [
                    neovim-nightly-overlay.overlays.default
                    dev-pkgs.overlays.default
                ];
            };
            settings = {
                username = "jenci";
                hostname = "nixos";
                cudapackages = pkgs.cudaPackages;
                timezone = "America/Asuncion";
                locale = "en_US.UTF-8";
            };
        in {
            nixosConfigurations = {
                main = lib.nixosSystem {
                    inherit pkgs;
                    specialArgs = {inherit self inputs outputs;} // settings;
                    modules = [ ./hosts/main/configuration.nix ];
                };
                laptop = lib.nixosSystem {
                    inherit pkgs;
                    specialArgs = {inherit self inputs outputs;} // settings;
                    modules = [ ./hosts/laptop/configuration.nix ];
                };
            };
        };
}

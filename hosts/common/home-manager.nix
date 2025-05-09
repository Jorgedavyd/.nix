{ pkgs, inputs, username, ... }:
{
    imports = [ home-manager.nixosModules.home-manager ];
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        users.${username} = import ../../home/${username}.nix;
    };
}

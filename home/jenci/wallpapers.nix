{ pkgs, ... }:

let
    wallpaperSpec = [
        {
            url = "https://raw.githubusercontent.com/FrenzyExists/wallpapers/main/Gruv/nix-gruv.jpg";
            sha256 = "sha256-jP+J4CC5OcMgyYIStw0ieOvW9yBGJSLtYpPW6cL4v0g=";
        }
    ];

    basename = url:
        let
            matches = builtins.match ".*/([^/]+)$" url;
        in
            if matches != null then builtins.head matches else "wallpaper";

    wallpaperFiles = builtins.listToAttrs (builtins.map (spec: {
        name = ".local/state/wallpapers/${basename spec.url}";
        value = {
            source = pkgs.fetchurl {
                url = spec.url;
                sha256 = spec.sha256;
            };
        };
    }) wallpaperSpec);
in {
    home.file = wallpaperFiles;
}

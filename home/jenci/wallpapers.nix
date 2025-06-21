{ pkgs, ... }:

let
    wallpaperSpec = [
        {
            url = "https://i.redd.it/exuu5e8qqus61.jpg";
            sha256 = "1n8s537fvyjgiw43y7d3a18zhwrfw1mrpiaq4z3c2qhnin4pirc2";
        }
        {
            url = "https://codeberg.org/Kyronix/dotfiles/raw/commit/7083487d1bb1fe82c0c49d9c060deeb4605a6ea7/niriFedora/Pictures/sh2-p.png";
            sha256 = "1n6sgh6m12bn412sjy6gnh8rvv02f3lkqpha3aarcdbl29dpqysp";
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

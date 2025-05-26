{ config, pkgs, lib, ... }:

let
    wallpaperSpec = [
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/alena-aenami-autumn-in-budapest.png";
            sha256 = "0gfb2q33gh0yqavrbviyganizq3bz8g29762jwd3zhi0gy9gdrh3";
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/alena-aenami-castle-in-the-sky.jpg";
            sha256 = "0frnjm65dvhs1s1h7924a7md30fsk3nhh9lv9cs3869afsdyqzs8";
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/bisbiswas-burning-clouds.png";
            sha256 = "1bc2bfrxf7nms9j8jc0m6d6np0bk9vxs9jzsna57nbaj97hqgyj9";
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/voyager-samurai-bebop-acoolrocket-edit.png";
            sha256 = "0rrh350mm1nyy80x49izq9s2a085f91508gs3xwn2y11qzqq2cbm";
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
    defaultPath =  "${config.home.homeDirectory}/.local/state/wallpapers";
    wallpaperPaths = builtins.map (spec:
        config.home.homeDirectory + "/.local/state/wallpapers/" + (basename spec.url)
    ) wallpaperSpec;
    wallpaperArg = lib.concatStringsSep "," wallpaperPaths;
in {
    home.file = wallpaperFiles;

    home.activation.setWallpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ${pkgs.gowall}/bin/gowall convert --batch ${wallpaperArg} -t rose-pine-moon
    '';
}

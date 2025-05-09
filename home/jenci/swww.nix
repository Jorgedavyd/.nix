{ pkgs, lib, ... }:

let
    wallpaperSpec = [
        {
            url = "https://github.com/HomeomorphicHooligan/arch-minimal-wallpapers/blob/main/wallpapers/full-hd/rosepine.png?raw=true";
            hash = lib.fakeSha256;
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/alena-aenami-horizon.png";
            hash = lib.fakeSha256;
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/alena-aenami-timeless.jpg";
            hash = lib.fakeSha256;
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/colormate-monogatari.jpg";
            hash = lib.fakeSha256;
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/colormate-monogatari.jpg";
            hash = lib.fakeSha256;
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/darkkal44-come-with-me-surfaces.png";
            hash = lib.fakeSha256;
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/gloomilygray-journey.jpg";
            hash = lib.fakeSha256;
        }
        {
            url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/alena-aenami-in-search-of-peace.png";
            hash = lib.fakeSha256;
        }
    ];
    basename = url:
        let
            matches = builtins.match ".*/([^/]+)$" url;
        in
            if matches != null then builtins.head matches else "wallpaper";

    imageFromURL = spec:
        pkgs.stdenv.mkDerivation rec {
            pname = basename spec.url;
            version = "1.0.0";
            src = pkgs.fetchurl {
                url = spec.url;
                sha256 = spec.hash;
            };

            installPhase = ''
        mkdir -p $out/share/wallpapers
        cp $src $out/share/wallpapers/${pname}
            '';
        };

    wallpapers = builtins.map imageFromURL wallpaperSpec;

in {
    home.packages = wallpapers;
}


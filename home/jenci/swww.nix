{ pkgs, lib, ... }:

let
    wallpaperSpec = [
        { url = "https://github.com/HomeomorphicHooligan/arch-minimal-wallpapers/blob/main/wallpapers/full-hd/rosepine.png?raw=true"; hash = "09nxpgskcnma8hhhzx5hlz51n7dgdxnls1vc8sphn2l59c479812"; }
        { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/alena-aenami-horizon.png"; hash = "18nhww2vcly7gzs5azz9l2260ygakmrqi8p480lzhq2w9jg1k7f9"; }
        { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/colormate-monogatari.jpg"; hash = "12271bd70hgmmjca564y8j4j6xx3qlra42dnpns6xhh52cdfv2w6"; }
        { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/darkkal44-come-with-me-surfaces.png"; hash = "15pznc75y3131d6bwqhq289sd8pccgyp4rg1kx5pv41lzcfjh8r9"; }
        { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/gloomilygray-journey.jpg"; hash = "07cs3gl8r059xja2rfm5qpckyb21s5sw29vq9fvgyln462zs1vqx"; }
        { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/alena-aenami-in-search-of-peace.png"; hash = "0p8hn43naix2pb4pdbw1jdbz4dmrj270a3w5llqwajk1rqjh22mx"; }
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

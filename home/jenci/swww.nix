{ config, pkgs, lib, ... }:

let
  wallpaperSpec = [
    { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/alena-aenami-horizon.png"; sha256 = "18nhww2vcly7gzs5azz9l2260ygakmrqi8p480lzhq2w9jg1k7f9"; }
    { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/colormate-monogatari.jpg"; sha256 = "12271bd70hgmmjca564y8j4j6xx3qlra42dnpns6xhh52cdfv2w6"; }
    { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/darkkal44-come-with-me-surfaces.png"; sha256 = "15pznc75y3131d6bwqhq289sd8pccgyp4rg1kx5pv41lzcfjh8r9"; }
    { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/gloomilygray-journey.jpg"; sha256 = "07cs3gl8r059xja2rfm5qpckyb21s5sw29vq9fvgyln462zs1vqx"; }
    { url = "https://raw.githubusercontent.com/DenverCoder1/minimalistic-wallpaper-collection/main/images/alena-aenami-in-search-of-peace.png"; sha256 = "0p8hn43naix2pb4pdbw1jdbz4dmrj270a3w5llqwajk1rqjh22mx"; }
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
in
{
  home.file = wallpaperFiles;

  home.activation.createWallpaperDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p "${config.home.homeDirectory}/.local/state/wallpapers"
  '';
}

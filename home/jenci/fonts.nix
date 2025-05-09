{ pkgs, lib, ... }:

let
  fontFromURL = name: hash: pkgs.stdenv.mkDerivation {
    pname = name;
    version = "3.4.0";
    src = pkgs.fetchzip {
      url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/${name}.zip";
      sha256 = hash;
    };

    installPhase = ''
      mkdir -p $out/share/fonts/${name}
      cp -r * $out/share/fonts/${name}
    '';
  };

  iosevka   = fontFromURL "Iosevka"       lib.fakeSha256;
  jetbrains = fontFromURL "JetBrainsMono" lib.fakeSha256;
  commit    = fontFromURL "CommitMono"    lib.fakeSha256;

in {
  fonts.fontconfig.enable = true;
  home.packages = [ iosevka jetbrains commit ];
}


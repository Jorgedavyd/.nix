{ pkgs, ... }:
let
    fontFromURL = name: sha256: pkgs.stdenv.mkDerivation {
        pname = name;
        version = "3.4.0";
        src = pkgs.fetchzip {
            url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/${name}.zip";
            sha256 = sha256;
        };

        installPhase = ''
      mkdir -p $out/share/fonts/${name}
      cp -r * $out/share/fonts/${name}
        '';
    };

    iosevka = fontFromURL "Iosevka" "0bz0jykmb5k9bippxz7hqz12iw772w9ik2ki1k8w6g4kiyxyxisi";
    jetbrains = fontFromURL "JetBrainsMono" "0g29gj9d6720grfr2vasnvdppzw4hycpfyd5di54d2p4mkrmzw3n";

in {
    fonts.fontconfig.enable = true;
    home.packages = [ iosevka jetbrains ];
}

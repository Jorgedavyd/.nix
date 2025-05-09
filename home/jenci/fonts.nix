{ pkgs, ... }:

let
    fontFromURL = name: hash: pkgs.stdenv.mkDerivation {
        pname = name;
        version = "3.4.0";
        src = pkgs.fetchzip {
            url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/${name}.zip";
            hash = hash;
        };

        installPhase = ''
      mkdir -p $out/share/fonts/${name}
      cp -r * $out/share/fonts/${name}
        '';
    };

    iosevka = fontFromURL "Iosevka" "0bz0jykmb5k9bippxz7hqz12iw772w9ik2ki1k8w6g4kiyxyxisi";
    jetbrains = fontFromURL "JetBrainsMono" "0g29gj9d6720grfr2vasnvdppzw4hycpfyd5di54d2p4mkrmzw3n";
    commit = fontFromURL "CommitMono" "08vzlrx5wdz1czifrmjv5nl68fiq01ki8nb4xa53j153ar08qrgs";

in {
    fonts.fontconfig.enable = true;
    home.packages = [ iosevka jetbrains commit ];
}
